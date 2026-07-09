"""ReleaseServer

Event-driven service for the EventAiAndDevOps demo:

  1. Exposes an HTTP endpoint (POST /update) that the GitHub Actions release
     workflow calls right after it publishes a GitHub Release. No polling.
  2. Downloads the release asset ``Update-<tag>.zip`` from the GitHub release
     into ``NewestRelease/``.
  3. Extracts it into ``FTPserver/`` (wiping the old contents first), writing
     ``arnbcfg.xml`` LAST so a PLC polling that file over FTP only ever sees
     it once every other file is already in place.
  4. Serves ``FTPserver/`` over anonymous FTP (read + write) so a PLC can
     download the new files.

Run:
    python release_server.py

Environment variables (all optional):
    GITHUB_OWNER        default "BRDK-Public"
    GITHUB_REPO         default "EventAiAndDevOps"
    RELEASE_SERVER_HTTP_PORT   default 8080
    RELEASE_SERVER_FTP_PORT    default 21
    GITHUB_TOKEN         optional, used for the download request if set
                          (not required for public repos)
"""

from __future__ import annotations

import json
import logging
import os
import shutil
import sys
import threading
import zipfile
from http.server import BaseHTTPRequestHandler, ThreadingHTTPServer
from pathlib import Path
from urllib.parse import parse_qs, urlparse

import requests
from pyftpdlib.authorizers import DummyAuthorizer
from pyftpdlib.handlers import FTPHandler
from pyftpdlib.servers import FTPServer

# --------------------------------------------------------------------------
# Configuration
# --------------------------------------------------------------------------

BASE_DIR = Path(__file__).resolve().parent
NEWEST_RELEASE_DIR = BASE_DIR / "NewestRelease"
FTP_ROOT_DIR = BASE_DIR / "FTPserver"

GITHUB_OWNER = os.environ.get("GITHUB_OWNER", "BRDK-Public")
GITHUB_REPO = os.environ.get("GITHUB_REPO", "EventAiAndDevOps")
GITHUB_TOKEN = os.environ.get("GITHUB_TOKEN")

HTTP_PORT = int(os.environ.get("RELEASE_SERVER_HTTP_PORT", "8080"))
FTP_PORT = int(os.environ.get("RELEASE_SERVER_FTP_PORT", "21"))

VERSION_MARKER_FILE = "arnbcfg.xml"

logging.basicConfig(
    level=logging.INFO,
    format="%(asctime)s [%(levelname)s] %(message)s",
    datefmt="%H:%M:%S",
)
log = logging.getLogger("release_server")

# Serialises update handling so two triggers can't race each other.
_update_lock = threading.Lock()


# --------------------------------------------------------------------------
# Release download + extraction
# --------------------------------------------------------------------------


def download_release_zip(tag: str) -> Path:
    """Download Update-<tag>.zip from the GitHub release into NewestRelease/."""
    zip_name = f"Update-{tag}.zip"
    url = (
        f"https://github.com/{GITHUB_OWNER}/{GITHUB_REPO}/releases/download/"
        f"{tag}/{zip_name}"
    )
    dest = NEWEST_RELEASE_DIR / zip_name

    headers = {}
    if GITHUB_TOKEN:
        headers["Authorization"] = f"Bearer {GITHUB_TOKEN}"

    log.info("Downloading release asset: %s", url)
    NEWEST_RELEASE_DIR.mkdir(parents=True, exist_ok=True)

    with requests.get(url, headers=headers, stream=True, timeout=30) as response:
        response.raise_for_status()
        tmp_dest = dest.with_suffix(dest.suffix + ".part")
        with open(tmp_dest, "wb") as f:
            for chunk in response.iter_content(chunk_size=1024 * 64):
                if chunk:
                    f.write(chunk)
        tmp_dest.replace(dest)

    log.info("Downloaded %s (%.1f KB)", dest.name, dest.stat().st_size / 1024)
    return dest


def extract_to_ftp_root(zip_path: Path) -> None:
    """Wipe FTPserver/ and repopulate it from the zip, writing the version
    marker file (arnbcfg.xml) last so the PLC never sees a half-updated
    directory."""
    staging_dir = NEWEST_RELEASE_DIR / f"_staging_{zip_path.stem}"
    if staging_dir.exists():
        shutil.rmtree(staging_dir)
    staging_dir.mkdir(parents=True)

    log.info("Extracting %s -> %s", zip_path.name, staging_dir)
    with zipfile.ZipFile(zip_path) as zf:
        zf.extractall(staging_dir)

    if not (staging_dir / VERSION_MARKER_FILE).exists():
        raise FileNotFoundError(
            f"Extracted release is missing expected marker file '{VERSION_MARKER_FILE}'"
        )

    log.info("Wiping current FTP root: %s", FTP_ROOT_DIR)
    if FTP_ROOT_DIR.exists():
        for entry in FTP_ROOT_DIR.iterdir():
            if entry.is_dir():
                shutil.rmtree(entry)
            else:
                entry.unlink()
    else:
        FTP_ROOT_DIR.mkdir(parents=True)

    # Copy everything except the marker file first...
    for entry in staging_dir.iterdir():
        if entry.name == VERSION_MARKER_FILE:
            continue
        dest = FTP_ROOT_DIR / entry.name
        if entry.is_dir():
            shutil.copytree(entry, dest)
        else:
            shutil.copy2(entry, dest)
        log.info("  copied %s", entry.name)

    # ...then the marker file last, so the PLC sees a fully-updated tree the
    # moment it notices the new arnbcfg.xml.
    shutil.copy2(staging_dir / VERSION_MARKER_FILE, FTP_ROOT_DIR / VERSION_MARKER_FILE)
    log.info("  copied %s (last, version marker)", VERSION_MARKER_FILE)

    shutil.rmtree(staging_dir)
    log.info("FTP root updated successfully.")


def handle_update(tag: str) -> None:
    with _update_lock:
        log.info("=== Handling update for tag '%s' ===", tag)
        zip_path = download_release_zip(tag)
        extract_to_ftp_root(zip_path)
        log.info("=== Update for tag '%s' complete ===", tag)


# --------------------------------------------------------------------------
# HTTP trigger endpoint
# --------------------------------------------------------------------------


class UpdateRequestHandler(BaseHTTPRequestHandler):
    def log_message(self, format: str, *args) -> None:  # noqa: A002
        log.info("HTTP %s - %s", self.address_string(), format % args)

    def _send_json(self, status: int, payload: dict) -> None:
        body = json.dumps(payload).encode("utf-8")
        self.send_response(status)
        self.send_header("Content-Type", "application/json")
        self.send_header("Content-Length", str(len(body)))
        self.end_headers()
        self.wfile.write(body)

    def do_GET(self) -> None:
        if urlparse(self.path).path == "/health":
            self._send_json(200, {"status": "ok"})
        else:
            self._send_json(404, {"error": "not found"})

    def do_POST(self) -> None:
        parsed = urlparse(self.path)
        if parsed.path != "/update":
            self._send_json(404, {"error": "not found"})
            return

        tag = self._extract_tag(parsed)
        if not tag:
            self._send_json(400, {"error": "missing 'tag' parameter"})
            return

        try:
            handle_update(tag)
        except Exception as exc:  # noqa: BLE001
            log.exception("Update for tag '%s' failed", tag)
            self._send_json(500, {"error": str(exc)})
            return

        self._send_json(200, {"status": "updated", "tag": tag})

    def _extract_tag(self, parsed) -> str | None:
        query_tag = parse_qs(parsed.query).get("tag", [None])[0]
        if query_tag:
            return query_tag

        length = int(self.headers.get("Content-Length", 0) or 0)
        if length:
            raw = self.rfile.read(length)
            try:
                data = json.loads(raw.decode("utf-8"))
                if isinstance(data, dict) and data.get("tag"):
                    return str(data["tag"])
            except (json.JSONDecodeError, UnicodeDecodeError):
                pass
        return None


def start_http_server() -> ThreadingHTTPServer:
    server = ThreadingHTTPServer(("0.0.0.0", HTTP_PORT), UpdateRequestHandler)
    thread = threading.Thread(target=server.serve_forever, daemon=True)
    thread.start()
    log.info("HTTP trigger endpoint listening on 0.0.0.0:%d (POST /update?tag=<tag>)", HTTP_PORT)
    return server


# --------------------------------------------------------------------------
# FTP server
# --------------------------------------------------------------------------


def start_ftp_server() -> FTPServer:
    FTP_ROOT_DIR.mkdir(parents=True, exist_ok=True)

    authorizer = DummyAuthorizer()
    authorizer.add_anonymous(str(FTP_ROOT_DIR), perm="elradfmwMT")

    handler = FTPHandler
    handler.authorizer = authorizer
    handler.banner = "EventAiAndDevOps ReleaseServer FTP ready."

    server = FTPServer(("0.0.0.0", FTP_PORT), handler)
    log.info("FTP server serving %s on 0.0.0.0:%d (anonymous, read+write)", FTP_ROOT_DIR, FTP_PORT)
    return server


# --------------------------------------------------------------------------
# Entry point
# --------------------------------------------------------------------------


def main() -> None:
    log.info("Starting ReleaseServer for %s/%s", GITHUB_OWNER, GITHUB_REPO)
    NEWEST_RELEASE_DIR.mkdir(parents=True, exist_ok=True)
    FTP_ROOT_DIR.mkdir(parents=True, exist_ok=True)

    start_http_server()
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
