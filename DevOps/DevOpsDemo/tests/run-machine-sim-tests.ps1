#requires -Version 3
<#
.SYNOPSIS
    End-to-end ARsim checks for the DevOpsDemo PackML machine.

.DESCRIPTION
    Builds and starts DevOpsDemo in ARsim, connects through as-cli, then verifies
    the runtime logbook, initial state, and simulator lifecycle.

.PARAMETER SkipSimBuild
    Reuse an already-running simulator instead of building and starting ARsim.

.PARAMETER KeepAlive
    Leave the simulator running after the checks complete.
#>
[CmdletBinding()]
param(
    [switch]$SkipSimBuild,
    [switch]$KeepAlive,
    [string]$AsCliPath = $(if ($env:AS_CLI_PATH) { $env:AS_CLI_PATH } else { Join-Path (Split-Path -Parent $PSScriptRoot) 'as-cli.exe' }),
    [string]$ProjectPath = $(if ($env:AS_PROJECT) { $env:AS_PROJECT } else { Join-Path (Split-Path -Parent $PSScriptRoot) 'DevOpsDemo.apj' }),
    [string]$Ip = $(if ($env:AS_PLC_IP) { $env:AS_PLC_IP } else { '127.0.0.1' })
)

$stoppedState = 2
$executeState = 6
$abortedState = 9
$stateTimeoutSeconds = if ($env:EM_STATE_TIMEOUT_SECONDS) { [double]$env:EM_STATE_TIMEOUT_SECONDS } elseif ($env:PACKML_STATE_TIMEOUT_SECONDS) { [double]$env:PACKML_STATE_TIMEOUT_SECONDS } else { 10.0 }
$moduleTasks = @('Main', 'EM_Conveyo', 'EM_Filler', 'EM_Capper')

$script:results = New-Object System.Collections.Generic.List[object]
$script:plcConnected = $false

function ConvertFrom-CliJson {
    param([AllowEmptyString()][string]$Text)

    $trimmed = $Text.Trim()
    if (-not $trimmed) { return $null }

    try {
        return ($trimmed | ConvertFrom-Json -ErrorAction Stop)
    }
    catch { }

    $objectStart = $trimmed.IndexOf('{')
    $arrayStart = $trimmed.IndexOf('[')
    $starts = @($objectStart, $arrayStart) | Where-Object { $_ -ge 0 }
    if ($starts.Count -eq 0) { return $null }

    $jsonText = $trimmed.Substring(($starts | Measure-Object -Minimum).Minimum)
    try {
        return ($jsonText | ConvertFrom-Json -ErrorAction Stop)
    }
    catch {
        return $null
    }
}

function Invoke-Cli {
    param(
        [Parameter(Mandatory = $true)][string[]]$CliArgs,
        [int]$TimeoutMs = 300000
    )

    $arguments = @('--project', $ProjectPath, '--timeout', "$TimeoutMs", '--format', 'json') + $CliArgs
    $argumentText = ($arguments | ForEach-Object { ConvertTo-ProcessArgument -Argument $_ }) -join ' '
    $stdoutPath = [System.IO.Path]::GetTempFileName()
    $stderrPath = [System.IO.Path]::GetTempFileName()
    $process = $null

    try {
        $process = Start-Process -FilePath $AsCliPath -ArgumentList $argumentText -RedirectStandardOutput $stdoutPath -RedirectStandardError $stderrPath -NoNewWindow -PassThru
        if (-not $process.WaitForExit($TimeoutMs)) {
            Stop-Process -Id $process.Id -Force -ErrorAction SilentlyContinue
            $timedOutOutput = (Get-Content -LiteralPath $stdoutPath -Raw -ErrorAction SilentlyContinue) + (Get-Content -LiteralPath $stderrPath -Raw -ErrorAction SilentlyContinue)
            return [pscustomobject]@{
                Exit = 124
                Out = ("as-cli timed out after {0} ms. {1}" -f $TimeoutMs, $timedOutOutput).Trim()
                Json = $null
            }
        }

        $process.Refresh()
        $out = (Get-Content -LiteralPath $stdoutPath -Raw -ErrorAction SilentlyContinue) + (Get-Content -LiteralPath $stderrPath -Raw -ErrorAction SilentlyContinue)
        return [pscustomobject]@{
            Exit = [int]$process.ExitCode
            Out = $out.Trim()
            Json = ConvertFrom-CliJson -Text $out
        }
    }
    finally {
        Remove-Item $stdoutPath, $stderrPath -Force -ErrorAction SilentlyContinue
    }
}

function ConvertTo-ProcessArgument {
    param([string]$Argument)

    if ($Argument -notmatch '[\s"]') { return $Argument }
    return '"' + $Argument.Replace('"', '\"') + '"'
}

function Read-RedirectedOutput {
    param(
        [string]$Path,
        [ref]$Offset,
        [ref]$Pending
    )

    try {
        $text = [System.IO.File]::ReadAllText($Path)
    }
    catch {
        return $false
    }

    if ($text.Length -le $Offset.Value) { return $false }
    $Pending.Value += $text.Substring($Offset.Value)
    $Offset.Value = $text.Length
    $wroteLine = $false

    while ($true) {
        $lineEnd = $Pending.Value.IndexOf("`n")
        if ($lineEnd -lt 0) { break }
        $line = $Pending.Value.Substring(0, $lineEnd).TrimEnd("`r")
        $Pending.Value = $Pending.Value.Substring($lineEnd + 1)
        Write-Host ('      | ' + $line)
        $wroteLine = $true
    }
    return $wroteLine
}

function Invoke-CliStreamed {
    param(
        [Parameter(Mandatory = $true)][string[]]$CliArgs,
        [int]$TimeoutMs = 900000
    )

    $arguments = @('--project', $ProjectPath, '--timeout', "$TimeoutMs") + $CliArgs
    $argumentText = ($arguments | ForEach-Object { ConvertTo-ProcessArgument -Argument $_ }) -join ' '
    $stdoutPath = [System.IO.Path]::GetTempFileName()
    $stderrPath = [System.IO.Path]::GetTempFileName()
    $stdoutOffset = 0
    $stderrOffset = 0
    $stdoutPending = ''
    $stderrPending = ''
    $process = $null

    try {
        $process = Start-Process -FilePath $AsCliPath -ArgumentList $argumentText -RedirectStandardOutput $stdoutPath -RedirectStandardError $stderrPath -NoNewWindow -PassThru
        while (-not $process.HasExited) {
            Read-RedirectedOutput -Path $stdoutPath -Offset ([ref]$stdoutOffset) -Pending ([ref]$stdoutPending) | Out-Null
            Read-RedirectedOutput -Path $stderrPath -Offset ([ref]$stderrOffset) -Pending ([ref]$stderrPending) | Out-Null
            Start-Sleep -Milliseconds 250
        }

        Read-RedirectedOutput -Path $stdoutPath -Offset ([ref]$stdoutOffset) -Pending ([ref]$stdoutPending) | Out-Null
        Read-RedirectedOutput -Path $stderrPath -Offset ([ref]$stderrOffset) -Pending ([ref]$stderrPending) | Out-Null
        if ($stdoutPending) { Write-Host ('      | ' + $stdoutPending) }
        if ($stderrPending) { Write-Host ('      | ' + $stderrPending) }
        Write-Host '      Build process finished.'
        $process.Refresh()
        $output = (Get-Content -LiteralPath $stdoutPath -Raw -ErrorAction SilentlyContinue) + (Get-Content -LiteralPath $stderrPath -Raw -ErrorAction SilentlyContinue)
        return [pscustomobject]@{
            Exit = [int]$process.ExitCode
            Failed = $output -match '(?im)Status:\s*FAILED|Build failed with \d+\s+error|^\s*ERROR:'
        }
    }
    finally {
        Remove-Item $stdoutPath, $stderrPath -Force -ErrorAction SilentlyContinue
    }
}

function Test-Step {
    param(
        [string]$Name,
        [scriptblock]$Body,
        [switch]$StopOnFailure
    )

    try {
        $result = & $Body
        if ($result -is [bool] -and -not $result) { throw 'assertion failed' }
        $script:results.Add([pscustomobject]@{ Name = $Name; Ok = $true })
        Write-Host ('  PASS  ' + $Name) -ForegroundColor Green
    }
    catch {
        $message = "$($_.Exception.Message)".Trim()
        $script:results.Add([pscustomobject]@{ Name = $Name; Ok = $false; Detail = $message })
        Write-Host ('  FAIL  ' + $Name) -ForegroundColor Red
        if ($message) { Write-Host ('        ' + ($message -replace "`n", "`n        ")) -ForegroundColor DarkGray }
        if ($StopOnFailure) { throw }
    }
}

function Get-FirstPropertyValue {
    param(
        $InputObject,
        [string[]]$Names
    )

    if ($null -eq $InputObject) { return $null }
    foreach ($name in $Names) {
        $property = $InputObject.PSObject.Properties[$name]
        if ($null -ne $property) { return $property.Value }
    }
    return $null
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

function ConvertTo-StateInt {
    param($Value)

    if ($Value -is [bool]) { return [int]$Value }
    if ($Value -is [System.IConvertible] -and -not ($Value -is [string])) { return [int]$Value }

    $text = "$Value".Trim('"')
    $colon = $text.LastIndexOf(':')
    if ($colon -ge 0) { $text = $text.Substring($colon + 1).Trim() }
    if ($text.StartsWith('0x', [System.StringComparison]::OrdinalIgnoreCase)) {
        return [Convert]::ToInt32($text.Substring(2), 16)
    }
    return [Convert]::ToInt32($text, [System.Globalization.CultureInfo]::InvariantCulture)
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

function Get-SimulatorState {
    $result = Invoke-Cli -CliArgs @('sim', 'status') -TimeoutMs 30000
    if ($result.Exit -ne 0) { return '' }
    $data = Get-FirstPropertyValue -InputObject $result.Json -Names @('data', 'Data')
    return [string](Get-FirstPropertyValue -InputObject $data -Names @('state', 'State'))
}

function Get-SimulatorRunning {
    $result = Invoke-Cli -CliArgs @('sim', 'status') -TimeoutMs 30000
    if ($result.Exit -ne 0) { return $false }
    $data = Get-FirstPropertyValue -InputObject $result.Json -Names @('data', 'Data')
    return [bool](Get-FirstPropertyValue -InputObject $data -Names @('running', 'Running'))
}

function Wait-Until {
    param(
        [string]$Description,
        [scriptblock]$Predicate,
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

function Ensure-MachineStopped {
    # Reset all machine commands. They can be left in a non-zero state if the previous test failed or was aborted.
    foreach ($commandName in @('hmi.startMachine', 'hmi.stopMachine', 'hmi.abortMachine', 'hmi.clearMachine')) {
        $reset = Invoke-Cli -CliArgs @('var', 'write', $commandName, '--value', '0', '--task', 'Main')
        if ($reset.Exit -ne 0) { throw "Initial machine command reset for $commandName failed with $($reset.Exit): $($reset.Out)" }
    }

    # If not stopped try 3 attempts to stop it. Clear if aborted.
    for ($attempt = 1; $attempt -le 3; $attempt++) {
        $states = Get-ModuleStates
        $allStopped = $true
        $hasAborted = $false
        foreach ($task in $moduleTasks) {
            if ($states[$task] -ne $stoppedState) { $allStopped = $false }
            if ($states[$task] -eq $abortedState) { $hasAborted = $true }
        }
        if (-not $allStopped) {
            $commandName = if ($hasAborted) { 'hmi.clearMachine' } else { 'hmi.stopMachine' }
            $command = Invoke-Cli -CliArgs @('var', 'write', $commandName, '--value', '1', '--task', 'Main')
            if ($command.Exit -ne 0) { throw "Initial machine $commandName command failed with $($command.Exit): $($command.Out)" }
        }

        Wait-ForAllModulesInState -ExpectedState $stoppedState | Out-Null

        Start-Sleep -Milliseconds 500

        $settledStates = Get-ModuleStates
        $settled = $true
        foreach ($task in $moduleTasks) {
            if ($settledStates[$task] -ne $stoppedState) { $settled = $false }
        }
        if ($settled) { return }
    }

    throw 'Machine did not remain stopped after three stop attempts.'
}

function Wait-ArSimRunning {
    return Wait-Until -Description 'ARsim to report RUN' -TimeoutSeconds 60 -IntervalMilliseconds 1000 -Predicate {
        (Get-SimulatorState).ToUpperInvariant() -eq 'RUN'
    }
}

function Wait-ArSimStopped {
    Wait-Until -Description 'ARsim to stop' -TimeoutSeconds 60 -IntervalMilliseconds 1000 -Predicate {
        -not (Get-SimulatorRunning)
    } | Out-Null
}

function Stop-Simulator {
    Write-Host '      Stopping ARsim...'
    $status = Invoke-Cli -CliArgs @('sim', 'status') -TimeoutMs 30000
    $data = Get-FirstPropertyValue -InputObject $status.Json -Names @('data', 'Data')
    $running = [bool](Get-FirstPropertyValue -InputObject $data -Names @('running', 'Running'))
    if ($running) {
        $stop = Invoke-Cli -CliArgs @('sim', 'stop') -TimeoutMs 60000
        if ($stop.Exit -ne 0) { Write-Warning "ARsim stop failed with $($stop.Exit): $($stop.Out)" }
        else { Wait-ArSimStopped }
    }

    Write-Host '      Disabling simulation...'
    $disable = Invoke-Cli -CliArgs @('sim', 'disable', '--no-clean') -TimeoutMs 180000
    if ($disable.Exit -ne 0) { Write-Warning "Simulation disable failed with $($disable.Exit): $($disable.Out)" }
}

function Connect-IfReady {
    $arguments = @('plc', 'connect', '--ip', $Ip)
    if ($env:AS_PLC_PORT) { $arguments += @('--port', $env:AS_PLC_PORT) }
    $result = Invoke-Cli -CliArgs $arguments
    if ($result.Exit -eq 0) {
        $script:plcConnected = $true
        return $true
    }
    return $false
}

function Assert-PlcConnected {
    if (-not $script:plcConnected) { throw 'PLC connection prerequisite failed.' }
}

if (-not (Test-Path $ProjectPath)) { Write-Error "AS project not found: $ProjectPath"; exit 2 }
if (-not (Test-Path $AsCliPath)) { Write-Error "as-cli was not found: $AsCliPath"; exit 2 }

Write-Host 'DevOpsDemo machine simulation tests'
Write-Host '================================='

try {
    if (-not $SkipSimBuild) {
        $enable = Invoke-Cli -CliArgs @('sim', 'enable', '--no-start', '--no-clean') -TimeoutMs 180000
        if ($enable.Exit -ne 0) { throw "Simulation enable failed with $($enable.Exit): $($enable.Out)" }

        Test-Step 'simulator build has no errors' -StopOnFailure {
            $build = Invoke-CliStreamed -CliArgs @('build', 'sim', '--filter', 'errors') -TimeoutMs 600000
            if ($build.Exit -ne 0 -or $build.Failed) {
                throw "build sim failed with exit $($build.Exit)."
            }
        }
    }

    Test-Step 'ARsim reports RUN' {
        Wait-ArSimRunning | Out-Null
    }

    # Connect to ARsim and wait for PVI to be started
    Test-Step 'PLC connects to ARsim' {
        # Restart works both if PVI is already running or not yet started 
        # (NOTE: if PVI started with elevated privileges, this will need to run in a terminal with elevated privileges as well)
        $restartPvi = Invoke-Cli -CliArgs @('pvi', 'restart') -TimeoutMs 20000
        if ($restartPvi.Exit -ne 0) { throw "PVI restart failed with $($restartPvi.Exit): $($restartPvi.Out)" }
        Wait-Until -Description 'PVI PLC connection to ARsim' -TimeoutSeconds 60 -IntervalMilliseconds 1000 -Predicate { Connect-IfReady } | Out-Null
    }

    Test-Step 'runtime logbook has no errors' {
        Assert-PlcConnected
        $result = Invoke-Cli -CliArgs @('logbook', 'read', '--count', '100', '--level', 'error')
        if ($result.Exit -ne 0) { throw "logbook read failed with $($result.Exit): $($result.Out)" }
        $entries = @(Find-LogEntries -Value $result.Json)
        if ($entries.Count -ne 0) {
            throw "Runtime logbook contains error entries: $($entries | ConvertTo-Json -Depth 10)`n$($result.Out)"
        }
    }

    Test-Step 'PackML state machine ready' -StopOnFailure {
        Assert-PlcConnected
        Ensure-MachineStopped
    }

    Test-Step 'PackML start and stop flow' {
        Assert-PlcConnected
        Ensure-MachineStopped

        $start = Invoke-Cli -CliArgs @('var', 'write', 'hmi.startMachine', '--value', '1', '--task', 'Main')
        if ($start.Exit -ne 0) { throw "Start command failed with $($start.Exit): $($start.Out)" }
        Wait-ForAllModulesInState -ExpectedState $executeState | Out-Null

        $stop = Invoke-Cli -CliArgs @('var', 'write', 'hmi.stopMachine', '--value', '1', '--task', 'Main')
        if ($stop.Exit -ne 0) { throw "Stop command failed with $($stop.Exit): $($stop.Out)" }
        Ensure-MachineStopped
    }

    Test-Step 'PackML start,abort and clear flow' {
            Assert-PlcConnected
            Ensure-MachineStopped

            $start = Invoke-Cli -CliArgs @('var', 'write', 'hmi.startMachine', '--value', '1', '--task', 'Main')
            if ($start.Exit -ne 0) { throw "Start command failed with $($start.Exit): $($start.Out)" }
            Wait-ForAllModulesInState -ExpectedState $executeState | Out-Null

            $abort = Invoke-Cli -CliArgs @('var', 'write', 'hmi.abortMachine', '--value', '1', '--task', 'Main')
            if ($abort.Exit -ne 0) { throw "Abort command failed with $($abort.Exit): $($abort.Out)" }
            Wait-ForAllModulesInState -ExpectedState $abortedState | Out-Null

            $clear = Invoke-Cli -CliArgs @('var', 'write', 'hmi.clearMachine', '--value', '1', '--task', 'Main')
            if ($clear.Exit -ne 0) { throw "Clear command failed with $($clear.Exit): $($clear.Out)" }
            Ensure-MachineStopped
        }

    Test-Step 'Test Conveyor Axis alarm and clear it' {
        Assert-PlcConnected
        Ensure-MachineStopped

        $start = Invoke-Cli -CliArgs @('var', 'write', 'hmi.startMachine', '--value', '1', '--task', 'Main')
        if ($start.Exit -ne 0) { throw "Start command failed with $($start.Exit): $($start.Out)" }
        Wait-ForAllModulesInState -ExpectedState $executeState | Out-Null

        $trigger = Invoke-Cli -CliArgs @('var', 'write', 'simulateAxisError', '--value', '1', '--task', 'EM_Conveyo')
        if ($trigger.Exit -ne 0) { throw "Conveyor axis alarm trigger failed with $($trigger.Exit): $($trigger.Out)" }
        Wait-ForAllModulesInState -ExpectedState $abortedState | Out-Null

        $clearAlarm = Invoke-Cli -CliArgs @('var', 'write', 'simulateAxisError', '--value', '0', '--task', 'EM_Conveyo')
        if ($clearAlarm.Exit -ne 0) { throw "Conveyor axis alarm clear failed with $($clearAlarm.Exit): $($clearAlarm.Out)" }
        $clear = Invoke-Cli -CliArgs @('var', 'write', 'hmi.clearMachine', '--value', '1', '--task', 'Main')
        if ($clear.Exit -ne 0) { throw "Clear command failed with $($clear.Exit): $($clear.Out)" }
        Ensure-MachineStopped
    }

    Test-Step 'Test Capper Axis alarm and clear it' {
        Assert-PlcConnected
        Ensure-MachineStopped

        $start = Invoke-Cli -CliArgs @('var', 'write', 'hmi.startMachine', '--value', '1', '--task', 'Main')
        if ($start.Exit -ne 0) { throw "Start command failed with $($start.Exit): $($start.Out)" }
        Wait-ForAllModulesInState -ExpectedState $executeState | Out-Null

        $trigger = Invoke-Cli -CliArgs @('var', 'write', 'simulateAxisError', '--value', '1', '--task', 'EM_Capper')
        if ($trigger.Exit -ne 0) { throw "Capper axis alarm trigger failed with $($trigger.Exit): $($trigger.Out)" }
        Wait-ForAllModulesInState -ExpectedState $abortedState | Out-Null

        $clearAlarm = Invoke-Cli -CliArgs @('var', 'write', 'simulateAxisError', '--value', '0', '--task', 'EM_Capper')
        if ($clearAlarm.Exit -ne 0) { throw "Capper axis alarm clear failed with $($clearAlarm.Exit): $($clearAlarm.Out)" }
        $clear = Invoke-Cli -CliArgs @('var', 'write', 'hmi.clearMachine', '--value', '1', '--task', 'Main')
        if ($clear.Exit -ne 0) { throw "Clear command failed with $($clear.Exit): $($clear.Out)" }
        Ensure-MachineStopped
    }

    Test-Step 'runtime logbook has no errors after all tests' {
        Assert-PlcConnected
        $result = Invoke-Cli -CliArgs @('logbook', 'read', '--count', '100', '--level', 'error')
        if ($result.Exit -ne 0) { throw "logbook read failed with $($result.Exit): $($result.Out)" }
        $entries = @(Find-LogEntries -Value $result.Json)
        if ($entries.Count -ne 0) {
            throw "Runtime logbook contains error entries after all tests: $($entries | ConvertTo-Json -Depth 10)`n$($result.Out)"
        }
    }

        #Ideas: Axis alarm, EM_Infeed error, EM_Filler error, EM_Capper error, EM_Outfeed error, etc.

}
finally {
    if ($script:plcConnected) {
        Invoke-Cli -CliArgs @('plc', 'disconnect') -TimeoutMs 30000 | Out-Null
    }
    if (-not $KeepAlive -and $env:AS_KEEP_SIM -ne '1') {
        Stop-Simulator
    }
}

$passed = @($script:results | Where-Object Ok).Count
$failed = @($script:results | Where-Object { -not $_.Ok }).Count
Write-Host '---------------------------------'
Write-Host ("{0} passed, {1} failed, {2} total" -f $passed, $failed, $script:results.Count)
if ($failed -gt 0) { exit 1 } else { exit 0 }