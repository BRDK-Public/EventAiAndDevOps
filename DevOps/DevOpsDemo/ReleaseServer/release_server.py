"""ReleaseServer - FTP server

Serves the published release folder over FTP so a PLC can download the update.

The GitHub Actions release workflow builds the project and copies the result
into ``C:\\ReleaseServer\\FTPserver`` (writing ``arnbcfg.xml`` last so the PLC
only sees the new version once every other file is in place). This script just
exposes that folder over FTP.

Run:
    python release_server.py

Environment variables (all optional):
    RELEASE_SERVER_FTP_ROOT   folder to serve   (default C:\\ReleaseServer\\FTPserver)
    RELEASE_SERVER_FTP_PORT   FTP port          (default 21)
"""

from __future__ import annotations

import logging
import os
import sys
from pathlib import Path

from pyftpdlib.authorizers import DummyAuthorizer
from pyftpdlib.handlers import FTPHandler
from pyftpdlib.servers import FTPServer

# --------------------------------------------------------------------------
# Configuration
# --------------------------------------------------------------------------

# Fixed, stable location the CI workflow publishes to and the FTP server serves.
# Overridable so the served folder is decoupled from the runner's ephemeral
# checkout (C:\actions-runner-...\_work\...). Defaults to a shared machine path.
FTP_ROOT_DIR = Path(
    os.environ.get("RELEASE_SERVER_FTP_ROOT", r"C:\ReleaseServer\FTPserver")
)

FTP_PORT = int(os.environ.get("RELEASE_SERVER_FTP_PORT", "21"))

# Hardcoded demo credentials - not for production use.
FTP_USERNAME = "update"
FTP_PASSWORD = "update"

logging.basicConfig(
    level=logging.INFO,
    format="%(asctime)s [%(levelname)s] %(message)s",
    datefmt="%H:%M:%S",
)
log = logging.getLogger("release_server")


# --------------------------------------------------------------------------
# FTP server
# --------------------------------------------------------------------------


def start_ftp_server() -> FTPServer:
    FTP_ROOT_DIR.mkdir(parents=True, exist_ok=True)

    authorizer = DummyAuthorizer()
    authorizer.add_user(FTP_USERNAME, FTP_PASSWORD, str(FTP_ROOT_DIR), perm="elradfmwMT")

    handler = FTPHandler
    handler.authorizer = authorizer
    handler.banner = "EventAiAndDevOps ReleaseServer FTP ready."

    server = FTPServer(("0.0.0.0", FTP_PORT), handler)
    log.info(
        "FTP server serving %s on 0.0.0.0:%d (user=%s, read+write)",
        FTP_ROOT_DIR,
        FTP_PORT,
        FTP_USERNAME,
    )
    return server


# --------------------------------------------------------------------------
# Entry point
# --------------------------------------------------------------------------


def main() -> None:
    log.info("Starting ReleaseServer FTP")
    ftp_server = start_ftp_server()

    try:
        ftp_server.serve_forever()
    except KeyboardInterrupt:
        log.info("Shutting down...")
        ftp_server.close_all()


if __name__ == "__main__":
    try:
        main()
    except PermissionError:
        log.error(
            "Permission denied binding to port %d. On Windows, binding to port 21 "
            "usually requires an elevated (Administrator) terminal.",
            FTP_PORT,
        )
        sys.exit(1)
