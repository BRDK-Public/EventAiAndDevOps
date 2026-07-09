from __future__ import annotations

from functools import lru_cache
import os
import re

import pytest

from ascli import PROJECT_ROOT, AsCli, as_int, as_text, collect_log_entries


CMD_RESET = int(os.environ.get("EM_CMD_RESET", os.environ.get("PACKML_CMD_RESET", "1")))
CMD_START = int(os.environ.get("EM_CMD_START", os.environ.get("PACKML_CMD_START", "2")))
CMD_STOP = int(os.environ.get("EM_CMD_STOP", os.environ.get("PACKML_CMD_STOP", "3")))
CMD_ABORT = int(os.environ.get("EM_CMD_ABORT", os.environ.get("PACKML_CMD_ABORT", "8")))
CMD_CLEAR = int(os.environ.get("EM_CMD_CLEAR", os.environ.get("PACKML_CMD_CLEAR", "9")))

STATE_STOPPED = int(os.environ.get("EM_STATE_STOPPED", os.environ.get("PACKML_STATE_STOPPED", "2")))
STATE_IDLE = int(os.environ.get("EM_STATE_IDLE", os.environ.get("PACKML_STATE_IDLE", "4")))
STATE_EXECUTE = int(os.environ.get("EM_STATE_EXECUTE", os.environ.get("PACKML_STATE_EXECUTE", "6")))
STATE_ABORTED = int(os.environ.get("EM_STATE_ABORTED", os.environ.get("PACKML_STATE_ABORTED", "9")))

ROOT_MODULE = os.environ.get("EM_ROOT_MODULE", os.environ.get("PACKML_ROOT_MODULE", "Main"))
ABORT_MODULE = os.environ.get("EM_ABORT_MODULE", os.environ.get("PACKML_ABORT_MODULE", "Gantry"))
GANTRY_CNC_PROGRAM = os.environ.get("GANTRY_CNC_PROGRAM", "cncPrg.st")


def test_simulator_build_has_no_errors(simulator):
    assert simulator.returncode == 0, simulator.text


def test_runtime_logbook_has_no_errors(as_cli: AsCli, simulator):
    result = as_cli.run("logbook", "read", "--count", "100", "--level", "error")
    entries = collect_log_entries(result.json)
    assert entries == [], f"Runtime logbook contains error entries: {entries!r}\n{result.text}"


def test_reset_start_puts_all_modules_in_execute(as_cli: AsCli, simulator):
    ensure_root_execute(as_cli)
    modules = wait_for_all_modules_in_state(as_cli, "EXECUTE")
    assert modules, "No modules were published through hmi.moduleDataProvider."


def test_abort_module_then_clear_ends_stopped(as_cli: AsCli, simulator):
    require_gantry_cnc_program()
    ensure_root_execute(as_cli)
    module_index = module_index_by_name(as_cli, ABORT_MODULE)

    as_cli.issue_hmi_command(module_index, CMD_ABORT)
    wait_for_root_state(as_cli, STATE_ABORTED)

    root_index = module_index_by_name(as_cli, ROOT_MODULE)
    as_cli.issue_hmi_command(root_index, CMD_CLEAR)
    wait_for_root_state(as_cli, STATE_STOPPED)


def test_reset_start_again_then_stop_ends_stopped(as_cli: AsCli, simulator):
    require_gantry_cnc_program()
    ensure_root_execute(as_cli)
    wait_for_all_modules_in_state(as_cli, "EXECUTE")

    root_index = module_index_by_name(as_cli, ROOT_MODULE)
    as_cli.issue_hmi_command(root_index, CMD_STOP)
    wait_for_root_state(as_cli, STATE_STOPPED)


def ensure_root_execute(as_cli: AsCli) -> None:
    root_index = module_index_by_name(as_cli, ROOT_MODULE)
    current_state = root_state(as_cli)
    if current_state == STATE_EXECUTE:
        return
    if current_state == STATE_ABORTED:
        as_cli.issue_hmi_command(root_index, CMD_CLEAR)
        wait_for_root_state(as_cli, STATE_STOPPED)
        current_state = STATE_STOPPED

    if current_state == STATE_STOPPED:
        as_cli.issue_hmi_command(root_index, CMD_RESET)
        wait_for_root_state(as_cli, STATE_IDLE)
    elif current_state != STATE_IDLE:
        raise AssertionError(f"Root module is in unexpected state {current_state}; cannot start deterministically.")

    as_cli.issue_hmi_command(root_index, CMD_START)
    wait_for_root_state(as_cli, STATE_EXECUTE)


def root_state(as_cli: AsCli) -> int:
    return as_int(as_cli.hmi_read("hmi.rootEmStatus.StateCurrent"))


def wait_for_root_state(as_cli: AsCli, expected_state: int) -> int:
    try:
        return as_cli.wait_until(
            f"root module state {expected_state}",
            lambda: _state_matches(as_cli, "hmi.rootEmStatus.StateCurrent", expected_state),
            timeout=float(os.environ.get("EM_STATE_TIMEOUT_SECONDS", os.environ.get("PACKML_STATE_TIMEOUT_SECONDS", "45"))),
        )
    except AssertionError as exc:
        raise AssertionError(f"{exc}\n\n{machine_diagnostics(as_cli)}") from exc


def wait_for_all_modules_in_state(as_cli: AsCli, expected_state: str) -> list[dict[str, str]]:
    try:
        return as_cli.wait_until(
            f"all modules to reach {expected_state}",
            lambda: _all_modules_in_state(as_cli, expected_state),
            timeout=float(os.environ.get("EM_STATE_TIMEOUT_SECONDS", os.environ.get("PACKML_STATE_TIMEOUT_SECONDS", "45"))),
        )
    except AssertionError as exc:
        raise AssertionError(f"{exc}\n\n{machine_diagnostics(as_cli)}") from exc


def module_index_by_name(as_cli: AsCli, expected_name: str) -> int:
    expected = _normalize_name(expected_name)
    modules = as_cli.wait_until(
        f"module {expected_name!r} to be listed",
        lambda: module_snapshot(as_cli),
        timeout=30,
    )
    for module in modules:
        if _normalize_name(module["name"]) == expected:
            return int(module["heap_index"])
    names = ", ".join(module["name"] for module in modules)
    raise AssertionError(f"Module {expected_name!r} was not found. Published modules: {names}")


def module_snapshot(as_cli: AsCli) -> list[dict[str, str]]:
    count = max(0, as_int(as_cli.hmi_read("hmi.numberOfEMs")))
    modules: list[dict[str, str]] = []
    for index in range(count):
        name = as_text(as_cli.hmi_read(f"hmi.moduleDataProvider.name[{index}]"))
        state = as_text(as_cli.hmi_read(f"hmi.moduleDataProvider.state[{index}]"))
        sub_state = as_text(as_cli.hmi_read(f"hmi.moduleDataProvider.subState[{index}]"))
        state_info = as_text(as_cli.hmi_read(f"hmi.moduleDataProvider.stateInfo[{index}]"))
        heap_index = as_int(as_cli.hmi_read(f"hmi.moduleDataProvider.heapEmIdx[{index}]"))
        if name:
            modules.append(
                {
                    "name": _normalize_name(name),
                    "state": state,
                    "sub_state": sub_state,
                    "state_info": state_info,
                    "heap_index": str(heap_index),
                }
            )
    return modules


def machine_diagnostics(as_cli: AsCli) -> str:
    modules = module_snapshot(as_cli)
    lines = [
        f"Root state: {root_state(as_cli)}",
        "Published modules:",
    ]
    for module in modules:
        lines.append(
            "- {name}: state={state}, sub_state={sub_state}, info={state_info}, heap_index={heap_index}".format(**module)
        )
    return "\n".join(lines)


def require_gantry_cnc_program() -> None:
    if os.environ.get("ALLOW_MISSING_GANTRY_CNC_PROGRAM", "0") == "1":
        return
    if not gantry_cnc_program_exists():
        pytest.xfail(
            f"Gantry starts CNC program {GANTRY_CNC_PROGRAM!r}, but that file is not present in the project. "
            "Abort/stop flow is expected to stall until the simulator has a valid CNC program."
        )


@lru_cache(maxsize=1)
def gantry_cnc_program_exists() -> bool:
    expected = GANTRY_CNC_PROGRAM.lower()
    return any(path.is_file() and path.name.lower() == expected for path in PROJECT_ROOT.rglob("*"))


def _state_matches(as_cli: AsCli, variable: str, expected_state: int) -> int | bool:
    current = as_int(as_cli.hmi_read(variable))
    return current if current == expected_state else False


def _all_modules_in_state(as_cli: AsCli, expected_state: str) -> list[dict[str, str]] | bool:
    modules = module_snapshot(as_cli)
    if not modules:
        return False
    wrong = [module for module in modules if module["state"].upper() != expected_state]
    return modules if not wrong else False


def _normalize_name(name: str) -> str:
    cleaned = re.sub(r"[^0-9A-Za-z_]+", "", name)
    return cleaned.strip()