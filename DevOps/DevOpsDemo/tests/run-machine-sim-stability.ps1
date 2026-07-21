#requires -Version 3
<#
.SYNOPSIS
    Runs the DevOpsDemo machine simulation suite continuously.

.DESCRIPTION
    Starts run-machine-sim-tests.ps1 as a separate PowerShell process for each
    iteration. The loop stops when a test run fails or when it is interrupted
    with Ctrl+C.

.PARAMETER SkipSimBuild
    Reuse an already-running simulator instead of building and starting ARsim.
    Use this with KeepAlive so the simulator remains available between runs.

.PARAMETER KeepAlive
    Leave the simulator running after each test run.

.PARAMETER DelaySeconds
    Wait this many seconds between successful test runs.

.PARAMETER AsCliPath
    Path to as-cli.exe. Defaults to AS_CLI_PATH or the project-local executable.

.PARAMETER ProjectPath
    Path to the Automation Studio project. Defaults to AS_PROJECT or DevOpsDemo.apj.

.PARAMETER Ip
    PLC IP address. Defaults to AS_PLC_IP or 127.0.0.1.
#>
[CmdletBinding()]
param(
    [switch]$SkipSimBuild,
    [switch]$KeepAlive,
    [ValidateRange(0, 86400)][int]$DelaySeconds = 0,
    [string]$AsCliPath = $(if ($env:AS_CLI_PATH) { $env:AS_CLI_PATH } else { Join-Path (Split-Path -Parent $PSScriptRoot) 'as-cli.exe' }),
    [string]$ProjectPath = $(if ($env:AS_PROJECT) { $env:AS_PROJECT } else { Join-Path (Split-Path -Parent $PSScriptRoot) 'DevOpsDemo.apj' }),
    [string]$Ip = $(if ($env:AS_PLC_IP) { $env:AS_PLC_IP } else { '127.0.0.1' })
)

$testScriptPath = Join-Path $PSScriptRoot 'run-machine-sim-tests.ps1'
if (-not (Test-Path -LiteralPath $testScriptPath)) {
    Write-Error "Machine simulation test script was not found: $testScriptPath"
    exit 2
}

function ConvertTo-ProcessArgument {
    param([string]$Argument)

    if ($Argument -notmatch '[\s"]') { return $Argument }
    return '"' + $Argument.Replace('"', '\"') + '"'
}

$powerShellPath = if ($PSVersionTable.PSEdition -eq 'Core') {
    Join-Path $PSHOME 'pwsh.exe'
}
else {
    Join-Path $PSHOME 'powershell.exe'
}

if (-not (Test-Path -LiteralPath $powerShellPath)) {
    Write-Error "PowerShell executable was not found: $powerShellPath"
    exit 2
}

$childArguments = @(
    '-NoProfile',
    '-ExecutionPolicy', 'Bypass',
    '-File', $testScriptPath,
    '-AsCliPath', $AsCliPath,
    '-ProjectPath', $ProjectPath,
    '-Ip', $Ip
)
if ($SkipSimBuild) { $childArguments += '-SkipSimBuild' }
if ($KeepAlive) { $childArguments += '-KeepAlive' }
$argumentText = ($childArguments | ForEach-Object { ConvertTo-ProcessArgument -Argument $_ }) -join ' '

$iteration = 0
Write-Host 'DevOpsDemo machine simulation stability runner'
Write-Host 'Press Ctrl+C to stop.'

try {
    while ($true) {
        $iteration++
        Write-Host "`n=== Stability iteration $iteration started at $(Get-Date -Format 'yyyy-MM-dd HH:mm:ss') ===" -ForegroundColor Cyan

        $process = Start-Process -FilePath $powerShellPath `
            -ArgumentList $argumentText `
            -WorkingDirectory $PSScriptRoot `
            -NoNewWindow `
            -PassThru `
            -Wait

        if ($process.ExitCode -ne 0) {
            Write-Host "=== Stability stopped: iteration $iteration failed with exit code $($process.ExitCode) ===" -ForegroundColor Red
            exit $process.ExitCode
        }

        Write-Host "=== Stability iteration $iteration passed at $(Get-Date -Format 'yyyy-MM-dd HH:mm:ss') ===" -ForegroundColor Green
        if ($DelaySeconds -gt 0) {
            Write-Host "Waiting $DelaySeconds seconds before the next iteration. Press Ctrl+C to stop."
            Start-Sleep -Seconds $DelaySeconds
        }
    }
}
catch {
    Write-Host "=== Stability runner stopped: $($_.Exception.Message) ===" -ForegroundColor Red
    exit 2
}
