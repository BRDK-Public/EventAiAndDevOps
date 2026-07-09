from __future__ import annotations

import os

import pytest

from ascli import AsCli


@pytest.fixture(scope="session")
def as_cli() -> AsCli:
    return AsCli()


@pytest.fixture(scope="session")
def simulator(as_cli: AsCli):
    as_cli.run("sim", "enable", "--no-start", timeout=180, check=False)
    build_result = as_cli.run("build", "sim", "--filter", "errors", timeout=600)

    as_cli.wait_until(
        "ARSim to report RUN",
        lambda: as_cli.sim_state().upper() == "RUN",
        timeout=60,
        interval=1.0,
    )
    as_cli.wait_until(
        "PVI PLC connection to ARSim",
        lambda: _connect_if_ready(as_cli),
        timeout=60,
        interval=1.0,
    )

    yield build_result

    as_cli.disconnect()
    if os.environ.get("AS_KEEP_SIM", "0") != "1":
        as_cli.run("sim", "disable", timeout=180, check=False)


def _connect_if_ready(as_cli: AsCli) -> bool:
    try:
        as_cli.connect()
        return True
    except AssertionError:
        return False