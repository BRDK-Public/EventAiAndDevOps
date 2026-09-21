from __future__ import annotations

import json
import os
import time

from ascli import AsCli, AsCliResult, as_int, collect_log_entries


STATE_STOPPED = int(os.environ.get("EM_STATE_STOPPED", os.environ.get("PACKML_STATE_STOPPED", "2")))
STATE_EXECUTE = int(os.environ.get("EM_STATE_EXECUTE", os.environ.get("PACKML_STATE_EXECUTE", "6")))
STATE_ABORTED = int(os.environ.get("EM_STATE_ABORTED", os.environ.get("PACKML_STATE_ABORTED", "9")))
STATE_TIMEOUT_SECONDS = float(os.environ.get("EM_STATE_TIMEOUT_SECONDS", os.environ.get("PACKML_STATE_TIMEOUT_SECONDS", "10")))

ROOT_MODULE = "Main"
CONVEYOR_TASK = "EM_Conveyo"
MODULE_TASKS = (ROOT_MODULE, CONVEYOR_TASK, "EM_Filler", "EM_Capper")
AR_SIM_TIMEOUT_SECONDS = 45
PLC_CONNECT_ATTEMPTS = 3


def test_01_start_pvi_manager(as_cli: AsCli):
    as_cli.run("daemon", "stop", timeout=30, check=False)
    result = as_cli.run("pvimanager", "restart", timeout=30)
    show_result("Start PVI Manager", result)


def test_02_project_status(as_cli: AsCli):
    result = as_cli.run("project", "status", timeout=300)
    show_result("Project status", result)


def test_03_build_sim(as_cli: AsCli):
    as_cli.run("sim", "enable", "--no-clean", "--no-start", timeout=30, check=False)
    result = as_cli.run("build", "sim", timeout=900)
    show_result("Build simulator", result)
    assert result.returncode == 0, result.text


def test_04_arsim_reaches_service_interface(as_cli: AsCli):
    as_cli.wait_until(
        "ARsim to report RUN",
        lambda: as_cli.sim_state().upper() == "RUN",
        timeout=AR_SIM_TIMEOUT_SECONDS,
        interval=3.0,
    )
    status = as_cli.run("sim", "status", timeout=30)
    show_result("ARsim status", status)
    timefactor = as_cli.run("sim", "timefactor", "+3", timeout=30)
    show_result("ARsim timefactor", timefactor)


def test_05_plc_connect(as_cli: AsCli):
    last_error: AssertionError | None = None
    for _ in range(PLC_CONNECT_ATTEMPTS):
        try:
            result = as_cli.connect(timeout=300)
            show_result("PLC connection", result)
            return
        except AssertionError as exc:
            last_error = exc
            time.sleep(3)
    raise AssertionError(str(last_error)) from last_error


def test_06_runtime_logbook_has_no_errors(as_cli: AsCli):
    assert_no_runtime_errors(as_cli, "Runtime logbook contains error entries")


def test_07_packml_state_machine_ready(as_cli: AsCli):
    wait_for_all_modules_in_state(as_cli, STATE_STOPPED)


def test_08_packml_start_and_stop_flow(as_cli: AsCli):
    write_main(as_cli, "hmi.startMachine", True)
    wait_for_all_modules_in_state(as_cli, STATE_EXECUTE)
    write_main(as_cli, "hmi.stopMachine", True)
    wait_for_all_modules_in_state(as_cli, STATE_STOPPED)


def test_09_packml_start_abort_and_clear_flow(as_cli: AsCli):
    write_main(as_cli, "hmi.startMachine", True)
    wait_for_all_modules_in_state(as_cli, STATE_EXECUTE)
    write_main(as_cli, "hmi.abortMachine", True)
    wait_for_all_modules_in_state(as_cli, STATE_ABORTED)
    write_main(as_cli, "hmi.clearMachine", True)
    wait_for_all_modules_in_state(as_cli, STATE_STOPPED)


def test_10_conveyor_axis_fault_and_recovery(as_cli: AsCli):
    write_main(as_cli, "hmi.startMachine", True)
    wait_for_all_modules_in_state(as_cli, STATE_EXECUTE)
    as_cli.write_var("simulateAxisError", True, task=CONVEYOR_TASK)
    wait_for_all_modules_in_state(as_cli, STATE_ABORTED)
    as_cli.write_var("simulateAxisError", False, task=CONVEYOR_TASK)
    write_main(as_cli, "hmi.clearMachine", True)
    wait_for_all_modules_in_state(as_cli, STATE_STOPPED)


def test_11_capper_axis_fault_and_recovery(as_cli: AsCli):
    write_main(as_cli, "hmi.startMachine", True)
    wait_for_all_modules_in_state(as_cli, STATE_EXECUTE)
    as_cli.write_var("simulateAxisError", True, task="EM_Capper")
    wait_for_all_modules_in_state(as_cli, STATE_ABORTED)
    as_cli.write_var("simulateAxisError", False, task="EM_Capper")
    write_main(as_cli, "hmi.clearMachine", True)
    wait_for_all_modules_in_state(as_cli, STATE_STOPPED)


def test_12_estop_and_clear_flow(as_cli: AsCli):
    as_cli.write_var("hw.di_EstopOK", False, task=ROOT_MODULE)
    wait_for_all_modules_in_state(as_cli, STATE_ABORTED)

    write_main(as_cli, "hmi.clearMachine", True)
    time.sleep(1)
    wait_for_all_modules_in_state(as_cli, STATE_ABORTED)

    as_cli.write_var("hw.di_EstopOK", True, task=ROOT_MODULE)
    write_main(as_cli, "hmi.clearMachine", True)
    wait_for_all_modules_in_state(as_cli, STATE_STOPPED)


def test_13_full_production_cycle(as_cli: AsCli):
    write_main(as_cli, "hmi.startMachine", True)
    wait_for_all_modules_in_state(as_cli, STATE_EXECUTE)

    counter_before = read_counter(as_cli)
    as_cli.write_var("hw.di_bottleReady", True, task=CONVEYOR_TASK)
    time.sleep(0.1)
    as_cli.write_var("hw.di_bottleReady", False, task=CONVEYOR_TASK)

    expected_counter = counter_before + 1
    wait_until_counter_reaches(as_cli, expected_counter, STATE_TIMEOUT_SECONDS)
    counter_after = read_counter(as_cli)
    assert counter_after == expected_counter, (
        f"productionCycleCount increment mismatch (expected {expected_counter}, got {counter_after})"
    )

    write_main(as_cli, "hmi.stopMachine", True)
    wait_for_all_modules_in_state(as_cli, STATE_STOPPED)


def test_14_full_production_cycle_with_100_bottles(as_cli: AsCli):
    write_main(as_cli, "hmi.startMachine", True)
    wait_for_all_modules_in_state(as_cli, STATE_EXECUTE)

    counter_before = read_counter(as_cli)
    expected_counter = counter_before + 100
    as_cli.write_var("sim.produce100Bottles", True, task=CONVEYOR_TASK)
    wait_until_counter_reaches(as_cli, expected_counter, STATE_TIMEOUT_SECONDS * 10)
    counter_after = read_counter(as_cli)
    assert counter_after == expected_counter, (
        f"productionCycleCount increment mismatch (expected {expected_counter}, got {counter_after})"
    )
    as_cli.wait_until(
        "sim.produce100Bottles to reset",
        lambda: not read_bool(as_cli.read_var("sim.produce100Bottles", task=CONVEYOR_TASK)),
        timeout=STATE_TIMEOUT_SECONDS,
    )

    write_main(as_cli, "hmi.stopMachine", True)
    wait_for_all_modules_in_state(as_cli, STATE_STOPPED)


def test_15_100_bottle_batch_survives_conveyor_axis_fault_and_recovery(as_cli: AsCli):
    counter_before = read_counter(as_cli)
    expected_counter = counter_before + 100

    write_main(as_cli, "hmi.startMachine", True)
    wait_for_all_modules_in_state(as_cli, STATE_EXECUTE)
    as_cli.write_var("sim.produce100BottlesWithAxisFault", True, task=CONVEYOR_TASK)

    as_cli.wait_until(
        "sim.axisFaultInjected to become true",
        lambda: read_bool(as_cli.read_var("sim.axisFaultInjected", task=CONVEYOR_TASK)),
        timeout=STATE_TIMEOUT_SECONDS * 10,
    )
    wait_for_all_modules_in_state(as_cli, STATE_ABORTED)

    counter_at_abort = read_counter(as_cli)
    assert counter_before + 25 <= counter_at_abort < expected_counter, (
        "Fault was injected outside the expected batch window "
        f"(baseline {counter_before}, aborted at {counter_at_abort})"
    )
    time.sleep(1)
    assert read_counter(as_cli) == counter_at_abort, "productionCycleCount changed while the machine was aborted"

    as_cli.write_var("simulateAxisError", False, task=CONVEYOR_TASK)
    write_main(as_cli, "hmi.clearMachine", True)
    wait_for_all_modules_in_state(as_cli, STATE_STOPPED)
    write_main(as_cli, "hmi.startMachine", True)
    wait_for_all_modules_in_state(as_cli, STATE_EXECUTE)

    wait_until_counter_reaches(as_cli, expected_counter, STATE_TIMEOUT_SECONDS * 10)
    counter_after = read_counter(as_cli)
    assert counter_after == expected_counter, (
        f"Recovered batch count mismatch (expected {expected_counter}, got {counter_after})"
    )
    assert not read_bool(as_cli.read_var("sim.produce100BottlesWithAxisFault", task=CONVEYOR_TASK)), (
        "sim.produce100BottlesWithAxisFault did not reset after batch completion"
    )

    write_main(as_cli, "hmi.stopMachine", True)
    wait_for_all_modules_in_state(as_cli, STATE_STOPPED)


def test_16_runtime_logbook_has_no_errors_after_all_tests(as_cli: AsCli):
    assert_no_runtime_errors(as_cli, "Runtime logbook contains error entries after all tests")


def write_main(as_cli: AsCli, variable_name: str, value: bool) -> None:
    as_cli.write_var(variable_name, value, task=ROOT_MODULE)


def assert_no_runtime_errors(as_cli: AsCli, message: str) -> None:
    result = as_cli.run("logbook", "read", "--count", "10", "--level", "error")
    show_result("Runtime logbook", result)
    entries = collect_log_entries(result.json)
    assert entries == [], f"{message}: {entries!r}\n{result.text}"


def wait_for_all_modules_in_state(as_cli: AsCli, expected_state: int) -> dict[str, int]:
    try:
        states = as_cli.wait_until(
            f"all modules to reach state {expected_state}",
            lambda: _all_modules_in_state(as_cli, expected_state),
            timeout=STATE_TIMEOUT_SECONDS,
        )
        print(f"\nPackML states (expected {expected_state}): {states}", flush=True)
        return states
    except AssertionError as exc:
        raise AssertionError(f"{exc}\n\n{machine_diagnostics(as_cli)}") from exc


def module_states(as_cli: AsCli) -> dict[str, int]:
    return {
        module_task: as_int(as_cli.read_var("em.StateCurrent", task=module_task))
        for module_task in MODULE_TASKS
    }


def machine_diagnostics(as_cli: AsCli) -> str:
    states = module_states(as_cli)
    return "\n".join(f"- {module_task}: em.StateCurrent={state}" for module_task, state in states.items())


def _all_modules_in_state(as_cli: AsCli, expected_state: int) -> dict[str, int] | bool:
    states = module_states(as_cli)
    return states if all(state == expected_state for state in states.values()) else False


def read_counter(as_cli: AsCli) -> int:
    return as_int(as_cli.read_var("productionCycleCount", task=CONVEYOR_TASK))


def wait_until_counter_reaches(as_cli: AsCli, expected_counter: int, timeout: float) -> None:
    as_cli.wait_until(
        f"productionCycleCount to reach {expected_counter}",
        lambda: read_counter(as_cli) >= expected_counter,
        timeout=timeout,
        interval=0.25,
    )


def read_bool(value: object) -> bool:
    if isinstance(value, bool):
        return value
    if isinstance(value, (int, float)):
        return value != 0
    text = str(value).strip().strip('"').lower()
    if ":" in text:
        text = text.rsplit(":", 1)[1].strip()
    if text in {"1", "true"}:
        return True
    if text in {"0", "false"}:
        return False
    raise AssertionError(f"Expected a boolean value, got {value!r}")


def show_result(label: str, result: AsCliResult) -> None:
    print(f"\n--- {label} ---", flush=True)
    if result.json is not None:
        print(json.dumps(result.json, indent=2, ensure_ascii=False), flush=True)
    elif result.text:
        print(result.text, flush=True)
    else:
        print("(no output)", flush=True)