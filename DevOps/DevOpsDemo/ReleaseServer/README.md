A seperate service that downloads the newest release from a Github Repo and publish it on a FTP server. A PLC can then download the PLC itself.

## How it works

This is event-driven, not polling. The `build-test-release.yml` workflow, right after it
publishes a GitHub Release, sends an HTTP request to this service telling it which tag was
just released. The service then:

1. Downloads `Update-<tag>.zip` from the GitHub release into [`NewestRelease/`](NewestRelease).
2. Extracts it, wipes [`FTPserver/`](FTPserver) and repopulates it with the new files -
   writing `arnbcfg.xml` **last**, since that's the file the PLC checks to detect a new
   version. This guarantees the PLC never sees a half-updated directory.
3. Serves [`FTPserver/`](FTPserver) over FTP (user `update` / password `update`, hardcoded
   for this demo) so the PLC can download the new files.

## Running

```powershell
pip install -r requirements.txt
python release_server.py
```

Binding to FTP port 21 requires an elevated (Administrator) PowerShell terminal on Windows.
Leave the script running in the foreground during the demo - it logs every step (HTTP
trigger received, download progress, extraction, FTP activity).

### Configuration (environment variables, all optional)

| Variable | Default | Purpose |
| --- | --- | --- |
| `GITHUB_OWNER` | `BRDK-Public` | Repo owner used to build the release download URL |
| `GITHUB_REPO` | `EventAiAndDevOps` | Repo name used to build the release download URL |
| `GITHUB_TOKEN` | _(none)_ | Optional auth token for the download request |
| `RELEASE_SERVER_HTTP_PORT` | `8080` | Port for the update-trigger HTTP endpoint |
| `RELEASE_SERVER_FTP_PORT` | `21` | Port for the anonymous FTP server |

### Manually triggering an update

```powershell
curl -X POST "http://localhost:8080/update?tag=v0.0.4"
```