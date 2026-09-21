from __future__ import annotations

import os

import pytest

from ascli import AsCli


@pytest.fixture(scope="session")
def as_cli() -> AsCli:
    return AsCli()


@pytest.fixture(scope="session", autouse=True)
def integration_cleanup(as_cli: AsCli):
    yield
    if os.environ.get("AS_KEEP_ALIVE", os.environ.get("AS_KEEP_SIM", "0")) != "1":
        as_cli.run("daemon", "stop", timeout=30, check=False)