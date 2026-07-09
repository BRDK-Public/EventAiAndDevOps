A simple FTP server that exposes the newest release so a PLC can download the update itself.

## How it works

The `build-test-release.yml` workflow builds the project and, on a tag push, copies the
result from `ReleaseCandidate/` into the fixed folder `C:\ReleaseServer\FTPserver` -
writing `arnbcfg.xml` **last**, since that's the file the PLC checks to detect a new
version. This guarantees the PLC never sees a half-updated directory.

This service simply serves that folder over FTP (user `update` / password `update`,
hardcoded for this demo) so the PLC can download the new files.

## Running

```powershell
pip install -r requirements.txt
python release_server.py
```

Binding to FTP port 21 requires an elevated (Administrator) PowerShell terminal on Windows.

### Configuration (environment variables, all optional)

| Variable | Default | Purpose |
| --- | --- | --- |
| `RELEASE_SERVER_FTP_ROOT` | `C:\ReleaseServer\FTPserver` | Folder served over FTP |
| `RELEASE_SERVER_FTP_PORT` | `21` | FTP port |

## Auto-start on boot

Register the FTP server as a Scheduled Task that runs at startup. Run once in an
**Administrator** PowerShell:

```powershell
$py = (Get-Command python).Source
$script = "C:\projects\EventAiAndDevOps\DevOps\DevOpsDemo\ReleaseServer\release_server.py"
$action    = New-ScheduledTaskAction -Execute $py -Argument "`"$script`"" -WorkingDirectory (Split-Path $script)
$trigger   = New-ScheduledTaskTrigger -AtStartup
$principal = New-ScheduledTaskPrincipal -UserId "SYSTEM" -RunLevel Highest
$settings  = New-ScheduledTaskSettingsSet -RestartCount 3 -RestartInterval (New-TimeSpan -Minutes 1) -AllowStartIfOnBatteries -DontStopIfGoingOnBatteries
Register-ScheduledTask -TaskName "ReleaseServerFTP" -Action $action -Trigger $trigger -Principal $principal -Settings $settings -Force
Start-ScheduledTask -TaskName "ReleaseServerFTP"
```

Remove it later with `Unregister-ScheduledTask -TaskName "ReleaseServerFTP"`.