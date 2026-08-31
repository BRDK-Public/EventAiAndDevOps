#requires -Version 3
<#
.SYNOPSIS
    End-to-end integration tests for as-cli against the committed integration_test
    project running under ARsim. Requires Automation Studio (+ ARsim) installed.

.DESCRIPTION
    Drives the built as-cli.exe as a black box: builds the project into ARsim and
    starts the simulator, connects over PVI, and exercises the online handlers
    (var read/write, logbook, io) plus a design-time sanity read. Reports PASS/FAIL
    per step and exits non-zero on any failure.

    This is the "proper end-to-end" tier. It needs a local Automation Studio install
    (so it can't run on CI - there is none) and is intentionally not in a git hook (it is
    slow). Run it locally before opening a PR that touches SDK-bound code. See
    docs/testing-strategy.md.

.PARAMETER SkipBuild
    Reuse the existing bin\Release\as-cli.exe instead of rebuilding it first.

.PARAMETER SkipSimBuild
    Assume ARsim is already running (skips 'build sim'); useful for fast iteration.

.PARAMETER KeepAlive
    Leave ARsim and the daemon running after the run (for debugging).

.EXAMPLE
    .\tests\run-integration-tests.ps1
    .\tests\run-integration-tests.ps1 -SkipSimBuild
#>
[CmdletBinding()]
param(
    [switch]$SkipBuild,
    [switch]$SkipSimBuild,
    [switch]$KeepAlive
)

# ------------------------- SETUP -------------------------
$root = Split-Path -Parent $PSScriptRoot
$proj = Join-Path $root 'DevOpsDemo.apj'
$exe  = Join-Path $root 'as-cli.exe'
$ip   = '127.0.0.1'
$stoppedState = 2
$executeState = 6
$abortedState = 9
$stateTimeoutSeconds = 10.0
$simpleProbeCycles = 25
$moduleTasks = @('Main', 'EM_Conveyo', 'EM_Filler', 'EM_Capper')
# ----------------------------------------------------------

$script:results = New-Object System.Collections.Generic.List[object]

function Invoke-Cli {
    param(
        [Parameter(Mandatory = $true)][string[]]$CliArgs,
        [int]$TimeoutMs = 300000
    )
    $argv = @('--project', $proj, '--timeout', "$TimeoutMs", '--format', 'json') + $CliArgs
    $out = (& $exe @argv 2>&1 | Out-String)
    $trimmed = $out.Trim()
    $json = $null
    if ($trimmed) {
        try { $json = $trimmed | ConvertFrom-Json -ErrorAction Stop }
        catch { }
    }
    return [pscustomobject]@{ Exit = $LASTEXITCODE; Out = $trimmed; Json = $json }
}

# Streamed variant for the long, daemon-spawning commands (project status, build sim) so their
# progress is visible live instead of buffered -- a slow AS init or build otherwise looks frozen,
# and a hang can't be located. Returns the CLI exit code.
function Invoke-CliStreamed {
    param(
        [Parameter(Mandatory = $true)][string[]]$CliArgs,
        [int]$TimeoutMs = 900000
    )
    $argv = @('--project', $proj, '--timeout', "$TimeoutMs") + $CliArgs
    & $exe @argv 2>&1 | ForEach-Object { Write-Host ('      | ' + $_) }
    return $LASTEXITCODE
}

function Test-Step {
    param([string]$Name, [scriptblock]$Body)
    try {
        $r = & $Body
        if ($r -is [bool] -and -not $r) { throw 'assertion failed' }
        $script:results.Add([pscustomobject]@{ Name = $Name; Ok = $true })
        Write-Host ('  PASS  ' + $Name) -ForegroundColor Green
    }
    catch {
        $msg = "$($_.Exception.Message)".Trim()
        $script:results.Add([pscustomobject]@{ Name = $Name; Ok = $false; Detail = $msg })
        Write-Host ('  FAIL  ' + $Name) -ForegroundColor Red
        if ($msg) { Write-Host ('        ' + ($msg -replace "`n", "`n        ")) -ForegroundColor DarkGray }
    }
}

# Poll the ARsim service interface until it responds (the simulator has booted).
function Wait-ArSimRunning {
    param([int]$TimeoutSec = 150)
    $deadline = (Get-Date).AddSeconds($TimeoutSec)
    do {
        $r = Invoke-Cli -CliArgs @('sim', 'status') -TimeoutMs 30000
        $reportsRun = $r.Json -and $r.Json.data -and $r.Json.data.state -ieq 'RUN'
        if ($r.Exit -eq 0 -and $reportsRun) { return $true }
        Start-Sleep -Seconds 3
    } while ((Get-Date) -lt $deadline)
    return $false
}

# Belt-and-suspenders daemon cleanup: after the graceful 'daemon stop', force-kill any
# as-cli daemon process still bound to this project so repeated runs never pile up daemons
# on the dev X20CP1686X. Matches only THIS project's daemon (by its spawn command line), leaving
# daemons for any other project untouched.
function Stop-LingeringDaemons {
    param([string]$ProjectPath)
    try {
        $needle = [regex]::Escape([System.IO.Path]::GetFileName($ProjectPath))
        $procs = Get-CimInstance Win32_Process -Filter "Name = 'as-cli.exe'" -ErrorAction SilentlyContinue |
            Where-Object { $_.CommandLine -and $_.CommandLine -match 'daemon\s+start' -and $_.CommandLine -match $needle }
        foreach ($p in $procs) {
            Stop-Process -Id $p.ProcessId -Force -ErrorAction SilentlyContinue
            Write-Host ('  (killed lingering daemon PID ' + $p.ProcessId + ')') -ForegroundColor DarkGray
        }
    }
    catch { }
}

function Find-LogEntries {
    param($Value)

    if ($null -eq $Value) { return }

    if ($Value -is [System.Collections.IDictionary]) {
        $names = @($Value.Keys)
        if ($names -contains 'level' -or $names -contains 'severity' -or $names -contains 'eventId' -or $names -contains 'timestamp') {
            Write-Output -NoEnumerate $Value
            return
        }
        foreach ($child in $Value.Values) { Find-LogEntries -Value $child }
        return
    }

    if ($Value -is [System.Collections.IEnumerable] -and -not ($Value -is [string])) {
        foreach ($child in $Value) { Find-LogEntries -Value $child }
        return
    }

    $properties = @($Value.PSObject.Properties | Where-Object { $_.MemberType -eq 'NoteProperty' })
    $names = @($properties | ForEach-Object { $_.Name })
    if ($names -contains 'level' -or $names -contains 'severity' -or $names -contains 'eventId' -or $names -contains 'timestamp') {
        Write-Output -NoEnumerate $Value
        return
    }
    foreach ($property in $properties) { Find-LogEntries -Value $property.Value }
}

function Find-NestedValue {
    param($Value)

    if ($null -eq $Value) { return $null }

    if ($Value -is [System.Collections.IDictionary]) {
        foreach ($name in @('value', 'Value', 'currentValue', 'CurrentValue')) {
            if ($Value.Contains($name)) { return $Value[$name] }
        }
        foreach ($child in $Value.Values) {
            $found = Find-NestedValue -Value $child
            if ($null -ne $found) { return $found }
        }
        return $null
    }

    if ($Value -is [System.Collections.IEnumerable] -and -not ($Value -is [string])) {
        foreach ($child in $Value) {
            $found = Find-NestedValue -Value $child
            if ($null -ne $found) { return $found }
        }
        return $null
    }

    $properties = @($Value.PSObject.Properties | Where-Object { $_.MemberType -eq 'NoteProperty' })
    foreach ($name in @('value', 'Value', 'currentValue', 'CurrentValue')) {
        $property = $properties | Where-Object { $_.Name -eq $name } | Select-Object -First 1
        if ($null -ne $property) { return $property.Value }
    }
    foreach ($property in $properties) {
        $found = Find-NestedValue -Value $property.Value
        if ($null -ne $found) { return $found }
    }
    return $null
}

function Get-CliValue {
    param(
        $Payload,
        [string]$Fallback
    )

    $value = Find-NestedValue -Value $Payload
    if ($null -ne $value) { return $value }

    $text = $Fallback.Trim()
    $colon = $text.LastIndexOf(':')
    if ($colon -ge 0) { $text = $text.Substring($colon + 1).Trim() }
    return $text.Trim('"')
}

function Assert-VariableValue {
    param(
        $Actual,
        $Expected,
        [string]$VariableName
    )

    if ($Expected -is [bool]) {
        $actualText = "$Actual".Trim('"').ToLowerInvariant()
        $actualBool = $null
        if ($Actual -is [bool]) {
            $actualBool = $Actual
        }
        elseif ($actualText -in @('1', 'true')) {
            $actualBool = $true
        }
        elseif ($actualText -in @('0', 'false')) {
            $actualBool = $false
        }

        if ($null -eq $actualBool -or $actualBool -ne $Expected) {
            throw "$VariableName read-back mismatch (expected $Expected, got $Actual)"
        }
        return
    }

    $actualText = "$Actual".Trim('"')
    $colon = $actualText.LastIndexOf(':')
    if ($colon -ge 0) { $actualText = $actualText.Substring($colon + 1).Trim() }
    try {
        $actualNumber = [decimal]::Parse($actualText, [System.Globalization.CultureInfo]::InvariantCulture)
        $expectedNumber = [decimal]$Expected
    }
    catch {
        throw "$VariableName returned a non-numeric value: $Actual"
    }
    if ($actualNumber -ne $expectedNumber) {
        throw "$VariableName read-back mismatch (expected $Expected, got $Actual)"
    }
}

function Write-And-Read-Variable {
    param(
        [Parameter(Mandatory = $true)][string]$VariableName,
        [Parameter(Mandatory = $true)]$Expected,
        [string]$Task,
        [int]$Round = 0
    )

    $writeArgs = @('var', 'write', $VariableName, '--value', "$Expected")
    if ($Task) { $writeArgs += @('--task', $Task) }
    $write = Invoke-Cli -CliArgs $writeArgs
    if ($write.Exit -ne 0) {
        throw "var write $VariableName failed with $($write.Exit): $($write.Out)"
    }

    $readArgs = @('var', 'read', $VariableName)
    if ($Task) { $readArgs += @('--task', $Task) }
    $read = Invoke-Cli -CliArgs $readArgs
    if ($read.Exit -ne 0) {
        throw "var read $VariableName failed with $($read.Exit): $($read.Out)"
    }

    $actual = Get-CliValue -Payload $read.Json -Fallback $read.Out
    $target = if ($Task) { '{0}:{1}' -f $Task, $VariableName } else { '{0} (global)' -f $VariableName }
    $roundText = if ($Round -gt 0) { 'round {0,2}' -f $Round } else { 'round --' }
    try {
        Assert-VariableValue -Actual $actual -Expected $Expected -VariableName $VariableName
        Write-Host ('        PASS {0} | {1,-30} | expected: {2,-12} | actual: {3}' -f $roundText, $target, "$Expected", "$actual") -ForegroundColor DarkGray
    }
    catch {
        Write-Host ('        FAIL {0} | {1,-30} | expected: {2,-12} | actual: {3}' -f $roundText, $target, "$Expected", "$actual") -ForegroundColor Red
        throw
    }
}

function ConvertTo-StateInt {
    param($Value)

    if ($Value -is [bool]) { return [int]$Value }
    if ($Value -is [System.IConvertible] -and -not ($Value -is [string])) { return [int]$Value }

    $text = "$Value".Trim('"')
    if ($text -ieq 'true') { return 1 }
    if ($text -ieq 'false') { return 0 }
    $colon = $text.LastIndexOf(':')
    if ($colon -ge 0) { $text = $text.Substring($colon + 1).Trim() }
    if ($text.StartsWith('0x', [System.StringComparison]::OrdinalIgnoreCase)) {
        return [Convert]::ToInt32($text.Substring(2), 16)
    }
    return [Convert]::ToInt32($text, [System.Globalization.CultureInfo]::InvariantCulture)
}

function Wait-Until {
    param(
        [Parameter(Mandatory = $true)][string]$Description,
        [Parameter(Mandatory = $true)][scriptblock]$Predicate,
        [double]$TimeoutSeconds = 30.0,
        [int]$IntervalMilliseconds = 250
    )

    $deadline = (Get-Date).AddSeconds($TimeoutSeconds)
    $lastValue = $null
    $lastError = $null
    while ((Get-Date) -lt $deadline) {
        try {
            $lastValue = & $Predicate
            if ($lastValue) { return $lastValue }
        }
        catch {
            $lastError = $_.Exception
        }
        Start-Sleep -Milliseconds $IntervalMilliseconds
    }

    $detail = " Last value: $lastValue."
    if ($null -ne $lastError) { $detail += " Last error: $($lastError.Message)" }
    throw "Timed out waiting for $Description.$detail"
}

function Read-ModuleState {
    param([string]$Task)

    $result = Invoke-Cli -CliArgs @('var', 'read', 'em.StateCurrent', '--task', $Task)
    if ($result.Exit -ne 0) { throw "var read em.StateCurrent for $Task failed with $($result.Exit): $($result.Out)" }
    return ConvertTo-StateInt -Value (Get-CliValue -Payload $result.Json -Fallback $result.Out)
}

function Read-MainCounter {
    param([Parameter(Mandatory = $true)][string]$CounterName)

    $result = Invoke-Cli -CliArgs @('var', 'read', $CounterName, '--task', 'Main')
    if ($result.Exit -ne 0) { throw "var read $CounterName for Main failed with $($result.Exit): $($result.Out)" }
    return ConvertTo-StateInt -Value (Get-CliValue -Payload $result.Json -Fallback $result.Out)
}

function Format-ProbeDiagnostics {
    $state = Read-MainCounter -CounterName 'writeProbeState'
    $count = Read-MainCounter -CounterName 'writeProbeCount'
    $start = Read-MainCounter -CounterName 'writeProbe.start'
    $stop = Read-MainCounter -CounterName 'writeProbe.stop'
    return "- writeProbeState=$state`n- writeProbeCount=$count`n- writeProbe.start=$start`n- writeProbe.stop=$stop"
}

function Wait-ForProbeCondition {
    param(
        [Parameter(Mandatory = $true)][string]$Description,
        [Parameter(Mandatory = $true)][scriptblock]$Predicate
    )

    try {
        Wait-Until -Description $Description -TimeoutSeconds $stateTimeoutSeconds -Predicate $Predicate | Out-Null
    }
    catch {
        throw "$($_.Exception.Message)`n`n$(Format-ProbeDiagnostics)"
    }
}

function Write-MainVariable {
    param(
        [Parameter(Mandatory = $true)][string]$VariableName,
        [Parameter(Mandatory = $true)][string]$Value
    )

    $result = Invoke-Cli -CliArgs @('var', 'write', $VariableName, '--value', $Value, '--task', 'Main')
    if ($result.Exit -ne 0) { throw "var write $VariableName for Main failed with $($result.Exit): $($result.Out)" }
}

function Get-ModuleStates {
    $states = @{}
    foreach ($task in $moduleTasks) {
        $states[$task] = Read-ModuleState -Task $task
    }
    return $states
}

function Format-MachineDiagnostics {
    $states = Get-ModuleStates
    return (($moduleTasks | ForEach-Object { "- ${_}: em.StateCurrent=$($states[$_])" }) -join "`n")
}

function Wait-ForAllModulesInState {
    param([int]$ExpectedState)

    try {
        return Wait-Until -Description "all modules to reach state $ExpectedState" -TimeoutSeconds $stateTimeoutSeconds -Predicate {
            $states = Get-ModuleStates
            foreach ($task in $moduleTasks) {
                if ($states[$task] -ne $ExpectedState) { return $false }
            }
            return $states
        }
    }
    catch {
        throw "$($_.Exception.Message)`n`n$(Format-MachineDiagnostics)"
    }
}

# ARsim leaves ar000loader (and the AR000 runtime) alive after 'sim stop' (loader stays).
# Force-kill them so simulators don't accumulate across runs and wedge later AS inits.
# This runner starts its own ARsim, so a clean slate is expected on a dev/test machine.
function Stop-ArSim {
    Get-Process ar000loader, AR000, arsim -ErrorAction SilentlyContinue |
        Stop-Process -Force -ErrorAction SilentlyContinue
}

# --- Preconditions -----------------------------------------------------------
if (-not (Test-Path $proj)) { Write-Error "Test project not found: $proj"; exit 2 }

# Start from a clean slate: a leftover daemon (locks the exe) or a leftover ARsim from an
# interrupted run can wedge Automation Studio init. Stop this project's daemon always, and
# the simulators unless we're reusing a running one (-SkipSimBuild).
Stop-LingeringDaemons -ProjectPath $proj
if (-not $SkipSimBuild) { Stop-ArSim }

if (-not (Test-Path $exe)) { Write-Error 'as-cli.exe not found; run without -SkipBuild.'; exit 2 }

Write-Host 'as-cli end-to-end (ARsim) integration tests'
Write-Host '==========================================='
Write-Host '(the first step starts the daemon; Automation Studio init can take up to ~2 min)' -ForegroundColor DarkGray

try {
  
    Test-Step 'Start PVI Manager' {
        $restartPvi = Invoke-Cli -CliArgs @('pvimanager', 'restart') -TimeoutMs 30000
        if ($restartPvi.Exit -ne 0) { throw "exit $($restartPvi.Exit): $($restartPvi.Out)" }
    }    

    # Show project status and active config. Will also start daemon.
    Test-Step 'project status' {
        $e = Invoke-CliStreamed -CliArgs @('project', 'status') -TimeoutMs 300000
        if ($e -ne 0) { throw "exit $e" }
    }

    # --- Build + start ARsim ---
    if (-not $SkipSimBuild) {
        Test-Step 'build sim (build + start ARsim)' {
            # Enable sim before trying to build it (or the build will fail)
            Invoke-Cli -CliArgs @('sim', 'enable', '--no-clean', '--no-start') -TimeoutMs 30000 | Out-Null
            # Build simulator and start ARsim.
            $e = Invoke-CliStreamed -CliArgs @('build', 'sim') -TimeoutMs 900000
            if ($e -ne 0) { throw "exit $e" }
        }
    }

    Test-Step 'ARsim reaches the service interface' {
        if (-not (Wait-ArSimRunning -TimeoutSec 45)) { throw 'ARsim service interface did not respond in time' }
        # Set simulator to max speed
        $w = Invoke-Cli -CliArgs @('sim', 'timefactor', '+3') -TimeoutMs 30000
        if ($w.Exit -ne 0) { throw "sim timefactor failed with $($w.Exit): $($w.Out)"}
    }

    # --- Online path (PVI over ARsim) ---
    Test-Step 'plc connect' {
        # PVI Manager may be cold-starting; its first connect can exceed the CLI's
        # internal 10s timeout, so retry a few times.
        $last = $null
        for ($i = 1; $i -le 3; $i++) {
            $last = Invoke-Cli -CliArgs @('plc', 'connect', '--ip', $ip)
            if ($last.Exit -eq 0) { return }
            Start-Sleep -Seconds 3
        }
        throw "exit $($last.Exit): $($last.Out)"
    }

    Test-Step 'runtime logbook has no errors' {
      
        $r = Invoke-Cli -CliArgs @('logbook', 'read', '--count', '10', '--level', 'error')
        if ($r.Exit -ne 0) { throw "logbook read failed with $($r.Exit): $($r.Out)" }
        $entries = @(Find-LogEntries -Value $r.Json)
        if ($entries.Count -ne 0) {
            throw "Runtime logbook contains error entries: $($entries | ConvertTo-Json -Depth 10)`n$($r.Out)"
        }
    }

    Test-Step 'PackML state machine ready' {
        Wait-ForAllModulesInState -ExpectedState $stoppedState | Out-Null       
    }

    Test-Step 'PackML start and stop flow' {
        $start = Invoke-Cli -CliArgs @('var', 'write', 'hmi.startMachine', '--value', 'true', '--task', 'Main')
        if ($start.Exit -ne 0) { throw "Start command failed with $($start.Exit): $($start.Out)" }
        Wait-ForAllModulesInState -ExpectedState $executeState | Out-Null

        $stop = Invoke-Cli -CliArgs @('var', 'write', 'hmi.stopMachine', '--value', 'true', '--task', 'Main')
        if ($stop.Exit -ne 0) { throw "Stop command failed with $($stop.Exit): $($stop.Out)" }
        Wait-ForAllModulesInState -ExpectedState $stoppedState | Out-Null
    }

    Test-Step 'PackML start,abort and clear flow' {
        $start = Invoke-Cli -CliArgs @('var', 'write', 'hmi.startMachine', '--value', 'true', '--task', 'Main')
        if ($start.Exit -ne 0) { throw "Start command failed with $($start.Exit): $($start.Out)" }
        Wait-ForAllModulesInState -ExpectedState $executeState | Out-Null

        $abort = Invoke-Cli -CliArgs @('var', 'write', 'hmi.abortMachine', '--value', 'true', '--task', 'Main')
        if ($abort.Exit -ne 0) { throw "Abort command failed with $($abort.Exit): $($abort.Out)" }
        Wait-ForAllModulesInState -ExpectedState $abortedState | Out-Null

        $clear = Invoke-Cli -CliArgs @('var', 'write', 'hmi.clearMachine', '--value', 'true', '--task', 'Main')
        if ($clear.Exit -ne 0) { throw "Clear command failed with $($clear.Exit): $($clear.Out)" }
        Wait-ForAllModulesInState -ExpectedState $stoppedState | Out-Null
    }

    Test-Step 'Conveyor axis fault and recovery' {
        $start = Invoke-Cli -CliArgs @('var', 'write', 'hmi.startMachine', '--value', 'true', '--task', 'Main')
        if ($start.Exit -ne 0) { throw "Start command failed with $($start.Exit): $($start.Out)" }
        Wait-ForAllModulesInState -ExpectedState $executeState | Out-Null

        $trigger = Invoke-Cli -CliArgs @('var', 'write', 'simulateAxisError', '--value', 'true', '--task', 'EM_Conveyo')
        if ($trigger.Exit -ne 0) { throw "Conveyor axis fault trigger failed with $($trigger.Exit): $($trigger.Out)" }
        Wait-ForAllModulesInState -ExpectedState $abortedState | Out-Null

        $clearFault = Invoke-Cli -CliArgs @('var', 'write', 'simulateAxisError', '--value', 'false', '--task', 'EM_Conveyo')
        if ($clearFault.Exit -ne 0) { throw "Conveyor axis fault clear failed with $($clearFault.Exit): $($clearFault.Out)" }
        $clear = Invoke-Cli -CliArgs @('var', 'write', 'hmi.clearMachine', '--value', 'true', '--task', 'Main')
        if ($clear.Exit -ne 0) { throw "Clear command failed with $($clear.Exit): $($clear.Out)" }
        Wait-ForAllModulesInState -ExpectedState $stoppedState | Out-Null
    }

    Test-Step 'Capper axis fault and recovery' {
        $start = Invoke-Cli -CliArgs @('var', 'write', 'hmi.startMachine', '--value', 'true', '--task', 'Main')
        if ($start.Exit -ne 0) { throw "Start command failed with $($start.Exit): $($start.Out)" }
        Wait-ForAllModulesInState -ExpectedState $executeState | Out-Null

        $trigger = Invoke-Cli -CliArgs @('var', 'write', 'simulateAxisError', '--value', 'true', '--task', 'EM_Capper')
        if ($trigger.Exit -ne 0) { throw "Capper axis fault trigger failed with $($trigger.Exit): $($trigger.Out)" }
        Wait-ForAllModulesInState -ExpectedState $abortedState | Out-Null

        $clearFault = Invoke-Cli -CliArgs @('var', 'write', 'simulateAxisError', '--value', 'false', '--task', 'EM_Capper')
        if ($clearFault.Exit -ne 0) { throw "Capper axis fault clear failed with $($clearFault.Exit): $($clearFault.Out)" }
        $clear = Invoke-Cli -CliArgs @('var', 'write', 'hmi.clearMachine', '--value', 'true', '--task', 'Main')
        if ($clear.Exit -ne 0) { throw "Clear command failed with $($clear.Exit): $($clear.Out)" }
        Wait-ForAllModulesInState -ExpectedState $stoppedState | Out-Null
    }

    Test-Step 'Estop and clear flow' {
        $w = Invoke-Cli -CliArgs @('var', 'write', 'hw.di_EstopOK', '--value', 'false', '--task', 'Main')
        if ($w.Exit -ne 0) { throw "Estop command failed with $($w.Exit): $($w.Out)" }
        Wait-ForAllModulesInState -ExpectedState $abortedState | Out-Null

        $w = Invoke-Cli -CliArgs @('var', 'write', 'hmi.clearMachine', '--value', 'true', '--task', 'Main')
        if ($w.Exit -ne 0) { throw "Clear command failed with $($w.Exit): $($w.Out)" }
        Start-Sleep -Seconds 1
        # Should not be possible clear while estop is active; expect still aborted.
        Wait-ForAllModulesInState -ExpectedState $abortedState | Out-Null

        #Release estop and clear again
        $w = Invoke-Cli -CliArgs @('var', 'write', 'hw.di_EstopOK', '--value', 'true', '--task', 'Main')
        if ($w.Exit -ne 0) { throw "Release estop command failed with $($w.Exit): $($w.Out)" }
        $w = Invoke-Cli -CliArgs @('var', 'write', 'hmi.clearMachine', '--value', 'true', '--task', 'Main')
        if ($w.Exit -ne 0) { throw "Clear command failed with $($w.Exit): $($w.Out)" }
        Wait-ForAllModulesInState -ExpectedState $stoppedState | Out-Null
    }

    Test-Step 'Full production cycle' {
        $w = Invoke-Cli -CliArgs @('var', 'write', 'hmi.startMachine', '--value', 'true', '--task', 'Main')
        if ($w.Exit -ne 0) { throw "Start command failed with $($w.Exit): $($w.Out)" }
        Wait-ForAllModulesInState -ExpectedState $executeState | Out-Null

        # Read productionCycleCount before the cycle.
        $r = Invoke-Cli -CliArgs @('var', 'read', 'productionCycleCount', '--task', 'EM_Conveyo')
        if ($r.Exit -ne 0) { throw "var read productionCycleCount failed with $($r.Exit): $($r.Out)" }
        $counterBefore = [uint16]$r.Json.data.value

        # Write true di_bottleReady, wait delay, then write di_bottleReady false to simulate a bottle passing through the conveyor.
        $w = Invoke-Cli -CliArgs @('var', 'write', 'hw.di_bottleReady', '--value', 'true', '--task', 'EM_Conveyo')
        if ($w.Exit -ne 0) { throw "var write hw.di_bottleReady failed with $($w.Exit): $($w.Out)" }
        Start-Sleep -Milliseconds 100
        # Disable di_bottleReady
        $w = Invoke-Cli -CliArgs @('var', 'write', 'hw.di_bottleReady', '--value', 'false', '--task', 'EM_Conveyo')
        if ($w.Exit -ne 0) { throw "var write hw.di_bottleReady failed with $($w.Exit): $($w.Out)" }

        # Wait for the productionCycleCount to increment.
        $timer = [System.Diagnostics.Stopwatch]::StartNew()
        $counterAfter = $counterBefore
        while ($timer.Elapsed.TotalSeconds -lt $stateTimeoutSeconds -and $counterAfter -eq $counterBefore) {
            Start-Sleep -Milliseconds 250
            $r = Invoke-Cli -CliArgs @('var', 'read', 'productionCycleCount', '--task', 'EM_Conveyo')
            if ($r.Exit -ne 0) { throw "var read productionCycleCount failed with $($r.Exit): $($r.Out)" }
            $counterAfter = [uint16]$r.Json.data.value
        }
        $expectedCounter = $counterBefore + 1
        if ($counterAfter -ne $expectedCounter) {
            throw "productionCycleCount increment mismatch (expected $expectedCounter, got $counterAfter)"
        }

        # Stop machine when test finished
        $w = Invoke-Cli -CliArgs @('var', 'write', 'hmi.stopMachine', '--value', 'true', '--task', 'Main')
        if ($w.Exit -ne 0) { throw "Stop command failed with $($w.Exit): $($w.Out)" }
        Wait-ForAllModulesInState -ExpectedState $stoppedState | Out-Null
    }

    Test-Step 'Full production cycle with 100 bottles' {
        $w = Invoke-Cli -CliArgs @('var', 'write', 'hmi.startMachine', '--value', 'true', '--task', 'Main')
        if ($w.Exit -ne 0) { throw "Start command failed with $($w.Exit): $($w.Out)" }
        Wait-ForAllModulesInState -ExpectedState $executeState | Out-Null

        $r = Invoke-Cli -CliArgs @('var', 'read', 'productionCycleCount', '--task', 'EM_Conveyo')
        if ($r.Exit -ne 0) { throw "var read productionCycleCount failed with $($r.Exit): $($r.Out)" }
        $counterBefore = [uint16]$r.Json.data.value

        $w = Invoke-Cli -CliArgs @('var', 'write', 'sim.produce100Bottles', '--value', 'true', '--task', 'EM_Conveyo')
        if ($w.Exit -ne 0) { throw "Produce 100 bottles command failed with $($w.Exit): $($w.Out)" }

        $expectedCounter = [uint16]($counterBefore + 100)
        Wait-Until -Description "productionCycleCount to reach $expectedCounter" -TimeoutSeconds ($stateTimeoutSeconds * 10) -IntervalMilliseconds 250 -Predicate {
            $r = Invoke-Cli -CliArgs @('var', 'read', 'productionCycleCount', '--task', 'EM_Conveyo')
            if ($r.Exit -ne 0) { throw "var read productionCycleCount failed with $($r.Exit): $($r.Out)" }
            return [uint16]$r.Json.data.value -ge $expectedCounter
        } | Out-Null

        $r = Invoke-Cli -CliArgs @('var', 'read', 'productionCycleCount', '--task', 'EM_Conveyo')
        if ($r.Exit -ne 0) { throw "var read productionCycleCount failed with $($r.Exit): $($r.Out)" }
        $counterAfter = [uint16]$r.Json.data.value
        if ($counterAfter -ne $expectedCounter) {
            throw "productionCycleCount increment mismatch (expected $expectedCounter, got $counterAfter)"
        }

        Wait-Until -Description 'sim.produce100Bottles to reset' -TimeoutSeconds $stateTimeoutSeconds -Predicate {
            $r = Invoke-Cli -CliArgs @('var', 'read', 'sim.produce100Bottles', '--task', 'EM_Conveyo')
            if ($r.Exit -ne 0) { throw "var read sim.produce100Bottles failed with $($r.Exit): $($r.Out)" }
            $actual = Get-CliValue -Payload $r.Json -Fallback $r.Out
            if ($actual -is [bool]) { return -not $actual }
            $actualText = "$actual".Trim('"').ToLowerInvariant()
            return $actualText -in @('0', 'false')
        } | Out-Null

        $w = Invoke-Cli -CliArgs @('var', 'write', 'hmi.stopMachine', '--value', 'true', '--task', 'Main')
        if ($w.Exit -ne 0) { throw "Stop command failed with $($w.Exit): $($w.Out)" }
        Wait-ForAllModulesInState -ExpectedState $stoppedState | Out-Null
    }

    Test-Step '100-bottle batch survives conveyor axis fault and recovery' {
        $r = Invoke-Cli -CliArgs @('var', 'read', 'productionCycleCount', '--task', 'EM_Conveyo')
        if ($r.Exit -ne 0) { throw "var read productionCycleCount failed with $($r.Exit): $($r.Out)" }
        $counterBefore = [uint16]$r.Json.data.value
        $expectedCounter = [uint16]($counterBefore + 100)

        Write-Host '        Batch started | target: 100 bottles' -ForegroundColor DarkGray

        $w = Invoke-Cli -CliArgs @('var', 'write', 'hmi.startMachine', '--value', 'true', '--task', 'Main')
        if ($w.Exit -ne 0) { throw "Start command failed with $($w.Exit): $($w.Out)" }
        Wait-ForAllModulesInState -ExpectedState $executeState | Out-Null

        $w = Invoke-Cli -CliArgs @('var', 'write', 'sim.produce100BottlesWithAxisFault', '--value', 'true', '--task', 'EM_Conveyo')
        if ($w.Exit -ne 0) { throw "Faulted batch command failed with $($w.Exit): $($w.Out)" }

        Wait-Until -Description 'sim.axisFaultInjected to become true' -TimeoutSeconds ($stateTimeoutSeconds * 10) -IntervalMilliseconds 250 -Predicate {
            $r = Invoke-Cli -CliArgs @('var', 'read', 'sim.axisFaultInjected', '--task', 'EM_Conveyo')
            if ($r.Exit -ne 0) { throw "var read sim.axisFaultInjected failed with $($r.Exit): $($r.Out)" }
            $actual = Get-CliValue -Payload $r.Json -Fallback $r.Out
            return "$actual".Trim('"').ToLowerInvariant() -in @('1', 'true')
        } | Out-Null
        Wait-ForAllModulesInState -ExpectedState $abortedState | Out-Null

        $r = Invoke-Cli -CliArgs @('var', 'read', 'productionCycleCount', '--task', 'EM_Conveyo')
        if ($r.Exit -ne 0) { throw "var read productionCycleCount failed with $($r.Exit): $($r.Out)" }
        $counterAtAbort = [uint16]$r.Json.data.value
        if ($counterAtAbort -lt ($counterBefore + 25) -or $counterAtAbort -ge $expectedCounter) {
            throw "Fault was injected outside the expected batch window (baseline $counterBefore, aborted at $counterAtAbort)"
        }
        Write-Host ('        Fault injected at {0}/100 | machine aborted' -f ($counterAtAbort - $counterBefore)) -ForegroundColor DarkGray

        Start-Sleep -Seconds 1
        $r = Invoke-Cli -CliArgs @('var', 'read', 'productionCycleCount', '--task', 'EM_Conveyo')
        if ($r.Exit -ne 0) { throw "var read productionCycleCount failed with $($r.Exit): $($r.Out)" }
        if ([uint16]$r.Json.data.value -ne $counterAtAbort) {
            throw "productionCycleCount changed while the machine was aborted"
        }
        Write-Host ('        Counter held at {0}/100 while aborted' -f ($counterAtAbort - $counterBefore)) -ForegroundColor DarkGray

        $w = Invoke-Cli -CliArgs @('var', 'write', 'simulateAxisError', '--value', 'false', '--task', 'EM_Conveyo')
        if ($w.Exit -ne 0) { throw "Conveyor axis fault clear failed with $($w.Exit): $($w.Out)" }
        $w = Invoke-Cli -CliArgs @('var', 'write', 'hmi.clearMachine', '--value', 'true', '--task', 'Main')
        if ($w.Exit -ne 0) { throw "Clear command failed with $($w.Exit): $($w.Out)" }
        Wait-ForAllModulesInState -ExpectedState $stoppedState | Out-Null

        $w = Invoke-Cli -CliArgs @('var', 'write', 'hmi.startMachine', '--value', 'true', '--task', 'Main')
        if ($w.Exit -ne 0) { throw "Restart command failed with $($w.Exit): $($w.Out)" }
        Wait-ForAllModulesInState -ExpectedState $executeState | Out-Null
        Write-Host '        Fault cleared | production recovered' -ForegroundColor DarkGray

        Wait-Until -Description "faulted batch to reach $expectedCounter" -TimeoutSeconds ($stateTimeoutSeconds * 10) -IntervalMilliseconds 250 -Predicate {
            $r = Invoke-Cli -CliArgs @('var', 'read', 'productionCycleCount', '--task', 'EM_Conveyo')
            if ($r.Exit -ne 0) { throw "var read productionCycleCount failed with $($r.Exit): $($r.Out)" }
            return [uint16]$r.Json.data.value -ge $expectedCounter
        } | Out-Null

        $r = Invoke-Cli -CliArgs @('var', 'read', 'productionCycleCount', '--task', 'EM_Conveyo')
        if ($r.Exit -ne 0) { throw "var read productionCycleCount failed with $($r.Exit): $($r.Out)" }
        if ([uint16]$r.Json.data.value -ne $expectedCounter) {
            throw "Recovered batch count mismatch (expected $expectedCounter, got $($r.Json.data.value))"
        }
        Write-Host '        Batch complete | 100/100 bottles' -ForegroundColor DarkGray

        $r = Invoke-Cli -CliArgs @('var', 'read', 'sim.produce100BottlesWithAxisFault', '--task', 'EM_Conveyo')
        if ($r.Exit -ne 0) { throw "var read sim.produce100BottlesWithAxisFault failed with $($r.Exit): $($r.Out)" }
        $actual = Get-CliValue -Payload $r.Json -Fallback $r.Out
        if ("$actual".Trim('"').ToLowerInvariant() -notin @('0', 'false')) {
            throw "sim.produce100BottlesWithAxisFault did not reset after batch completion"
        }

        $w = Invoke-Cli -CliArgs @('var', 'write', 'hmi.stopMachine', '--value', 'true', '--task', 'Main')
        if ($w.Exit -ne 0) { throw "Stop command failed with $($w.Exit): $($w.Out)" }
        Wait-ForAllModulesInState -ExpectedState $stoppedState | Out-Null
    }

    Test-Step 'runtime logbook has no errors after all tests' {
        $r = Invoke-Cli -CliArgs @('logbook', 'read', '--count', '10', '--level', 'error')
        if ($r.Exit -ne 0) { throw "logbook read failed with $($r.Exit): $($r.Out)" }
        $entries = @(Find-LogEntries -Value $r.Json)
        if ($entries.Count -ne 0) {
            throw "Runtime logbook contains error entries after all tests: $($entries | ConvertTo-Json -Depth 10)`n$($r.Out)"
        }
    }

}
finally {
    if (-not $KeepAlive) {
        Write-Host ''
        Write-Host 'Cleanup: stopping the daemon and ARsim...' -ForegroundColor DarkGray
        #Invoke-Cli -CliArgs @('sim', 'disable', '--no-clean') -TimeoutMs 30000 | Out-Null
        Invoke-Cli -CliArgs @('daemon', 'stop') -TimeoutMs 30000 | Out-Null
        Stop-LingeringDaemons -ProjectPath $proj
        #Stop-ArSim
    }
}

# --- Summary -----------------------------------------------------------------
$passed = @($script:results | Where-Object Ok).Count
$failed = @($script:results | Where-Object { -not $_.Ok }).Count
Write-Host '-------------------------------------------'
Write-Host ("{0} passed, {1} failed, {2} total" -f $passed, $failed, $script:results.Count)
if ($failed -gt 0) { exit 1 } else { exit 0 }
