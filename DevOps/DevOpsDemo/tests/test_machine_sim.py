from __future__ import annotations

import os

from ascli import AsCli, as_int, collect_log_entries


STATE_STOPPED = int(os.environ.get("EM_STATE_STOPPED", os.environ.get("PACKML_STATE_STOPPED", "2")))
STATE_EXECUTE = int(os.environ.get("EM_STATE_EXECUTE", os.environ.get("PACKML_STATE_EXECUTE", "6")))

ROOT_MODULE = "Main"
MODULE_TASKS = (ROOT_MODULE, "EM_Infeed", "EM_Filler", "EM_Capper", "EM_Outfeed")
STATE_TIMEOUT_SECONDS = float(os.environ.get("EM_STATE_TIMEOUT_SECONDS", os.environ.get("PACKML_STATE_TIMEOUT_SECONDS", "4")))


def test_simulator_build_has_no_errors(simulator):
    assert simulator.returncode == 0, simulator.text


def test_runtime_logbook_has_no_errors(as_cli: AsCli, simulator):
    result = as_cli.run("logbook", "read", "--count", "100", "--level", "error")
    entries = collect_log_entries(result.json)
    assert entries == [], f"Runtime logbook contains error entries: {entries!r}\n{result.text}"


def test_program_local2_is_two(as_cli: AsCli, simulator):
    value = as_cli.read_var("em.StateCurrent", task="Main")
    assert as_int(value) == 2, f"Program.local2 expected 2, got {value!r}"


def test_packml_start_stop_flow(as_cli: AsCli, simulator):
    wait_for_all_modules_in_state(as_cli, STATE_STOPPED)
    as_cli.write_var("em.Command.Reset", True, task=ROOT_MODULE)
    wait_for_all_modules_in_state(as_cli, STATE_EXECUTE)
    as_cli.write_var("em.Command.Stop", True, task=ROOT_MODULE)
    wait_for_all_modules_in_state(as_cli, STATE_STOPPED)


def wait_for_all_modules_in_state(as_cli: AsCli, expected_state: int) -> dict[str, int]:
    try:
        return as_cli.wait_until(
            f"all modules to reach state {expected_state}",
            lambda: _all_modules_in_state(as_cli, expected_state),
            timeout=STATE_TIMEOUT_SECONDS,
        )
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