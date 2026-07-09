from __future__ import annotations

import json
import os
import subprocess
import time
from dataclasses import dataclass
from pathlib import Path
from typing import Any, Iterable


PROJECT_ROOT = Path(__file__).resolve().parents[1]
DEFAULT_AS_CLI = PROJECT_ROOT / ".github" / "skills" / "as-cli" / "as-cli.exe"
DEFAULT_PROJECT = PROJECT_ROOT / "Avantpak.apj"


@dataclass(frozen=True)
class AsCliResult:
    args: tuple[str, ...]
    returncode: int
    stdout: str
    stderr: str
    json: Any | None

    @property
    def text(self) -> str:
        return "\n".join(part for part in (self.stdout, self.stderr) if part).strip()


class AsCli:
    def __init__(self) -> None:
        self.exe = Path(os.environ.get("AS_CLI_PATH", DEFAULT_AS_CLI))
        self.project = Path(os.environ.get("AS_PROJECT", DEFAULT_PROJECT))
        self.timeout = int(os.environ.get("AS_CLI_TIMEOUT_SECONDS", "120"))
        self.hmi_task = os.environ.get("AS_HMI_TASK", "HmiCtrl")

        if not self.exe.exists():
            raise AssertionError(f"AS CLI was not found at {self.exe}. Set AS_CLI_PATH to override it.")
        if not self.project.exists():
            raise AssertionError(f"AS project was not found at {self.project}. Set AS_PROJECT to override it.")

    def run(self, *args: str, timeout: int | None = None, check: bool = True) -> AsCliResult:
        command = [str(self.exe), *args, "--project", str(self.project), "--format", "json"]
        completed = subprocess.run(
            command,
            cwd=PROJECT_ROOT,
            text=True,
            capture_output=True,
            timeout=timeout or self.timeout,
        )
        parsed = _parse_json(completed.stdout)
        result = AsCliResult(tuple(args), completed.returncode, completed.stdout, completed.stderr, parsed)
        if check and completed.returncode != 0:
            raise AssertionError(f"as-cli {' '.join(args)} failed with {completed.returncode}:\n{result.text}")
        return result

    def connect(self) -> None:
        args = ["plc", "connect", "--ip", os.environ.get("AS_PLC_IP", "127.0.0.1")]
        port = os.environ.get("AS_PLC_PORT")
        if port:
            args.extend(["--port", port])
        self.run(*args)

    def sim_state(self) -> str:
        result = self.run("sim", "status", check=False)
        payload = result.json
        if isinstance(payload, dict):
            data = payload.get("data")
            if isinstance(data, dict):
                return str(data.get("state", ""))
        return ""

    def disconnect(self) -> None:
        self.run("plc", "disconnect", check=False)

    def read_var(self, name: str, task: str | None = None) -> Any:
        args = ["var", "read", name]
        if task:
            args.extend(["--task", task])
        result = self.run(*args)
        return _extract_value(result.json, result.stdout)

    def write_var(self, name: str, value: Any, task: str | None = None) -> None:
        args = ["var", "write", name, "--value", _format_value(value)]
        if task:
            args.extend(["--task", task])
        self.run(*args)

    def hmi_read(self, name: str) -> Any:
        return self.read_var(name, task=self.hmi_task)

    def hmi_write(self, name: str, value: Any) -> None:
        self.write_var(name, value, task=self.hmi_task)

    def issue_hmi_command(self, module_index: int, command: int) -> None:
        self.hmi_write("hmi.emIdx", module_index)
        self.hmi_write("hmi.command.command", command)
        self.hmi_write("hmi.command.executeCmd", 1)

    def wait_until(self, description: str, predicate, timeout: float = 30.0, interval: float = 0.25) -> Any:
        deadline = time.monotonic() + timeout
        last_error: Exception | None = None
        last_value: Any = None
        while time.monotonic() < deadline:
            try:
                last_value = predicate()
                if last_value:
                    return last_value
            except Exception as exc:  # Keep retrying while the runtime finishes startup.
                last_error = exc
            time.sleep(interval)
        detail = f" Last value: {last_value!r}."
        if last_error:
            detail += f" Last error: {last_error}"
        raise AssertionError(f"Timed out waiting for {description}.{detail}")


def _parse_json(stdout: str) -> Any | None:
    text = stdout.strip()
    if not text:
        return None
    try:
        return json.loads(text)
    except json.JSONDecodeError:
        start = min((idx for idx in (text.find("{"), text.find("[")) if idx >= 0), default=-1)
        if start < 0:
            return None
        try:
            return json.loads(text[start:])
        except json.JSONDecodeError:
            return None


def _extract_value(payload: Any, fallback: str) -> Any:
    for value in _walk_values(payload):
        if isinstance(value, dict):
            for key in ("value", "Value", "currentValue", "CurrentValue"):
                if key in value:
                    return value[key]
    if isinstance(payload, dict):
        for key in ("value", "Value", "data", "Data"):
            if key in payload and not isinstance(payload[key], (dict, list)):
                return payload[key]
    text = fallback.strip()
    if ":" in text:
        text = text.rsplit(":", 1)[1].strip()
    return text.strip('"')


def _walk_values(value: Any) -> Iterable[Any]:
    yield value
    if isinstance(value, dict):
        for child in value.values():
            yield from _walk_values(child)
    elif isinstance(value, list):
        for child in value:
            yield from _walk_values(child)


def _format_value(value: Any) -> str:
    if isinstance(value, bool):
        return "1" if value else "0"
    return str(value)


def as_int(value: Any) -> int:
    if isinstance(value, bool):
        return int(value)
    if isinstance(value, (int, float)):
        return int(value)
    text = str(value).strip().strip('"')
    if ":" in text:
        text = text.rsplit(":", 1)[1].strip()
    return int(text, 0)


def as_text(value: Any) -> str:
    return str(value).strip().strip('"').strip("\x00")


def collect_log_entries(payload: Any) -> list[Any]:
    entries: list[Any] = []
    for value in _walk_values(payload):
        if isinstance(value, dict) and any(key.lower() in {"level", "severity", "eventid", "timestamp"} for key in value):
            entries.append(value)
    return entries