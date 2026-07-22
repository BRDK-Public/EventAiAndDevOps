#requires -Version 3
<##
.SYNOPSIS
    Measures the time required for as-cli to read a PLC variable.

.DESCRIPTION
    Connects to the PLC, performs optional warmup reads, then measures each
    as-cli var read invocation separately. The simulator must already be
    running, and the variable must be readable from the selected task.

.PARAMETER Variable
    PLC variable to read.

.PARAMETER Task
    Automation Studio task that owns the variable.

.PARAMETER Iterations
    Number of timed reads to perform.

.PARAMETER WarmupIterations
    Number of untimed reads performed before the benchmark.

.PARAMETER AsCliPath
    Path to as-cli.exe. Defaults to AS_CLI_PATH or the project directory.

.PARAMETER ProjectPath
    Path to the Automation Studio project. Defaults to AS_PROJECT or the
    parent directory of this tests folder.

.PARAMETER Ip
    PLC IP address. Defaults to AS_PLC_IP or 127.0.0.1.
#>
[CmdletBinding()]
param(
    [string]$Variable = 'em.StateCurrent',
    [string]$Task = 'Main',
    [ValidateRange(1, 10000)][int]$Iterations = 20,
    [ValidateRange(0, 1000)][int]$WarmupIterations = 2,
    [ValidateRange(1, 600000)][int]$TimeoutMs = 30000,
    [string]$AsCliPath = $(if ($env:AS_CLI_PATH) { $env:AS_CLI_PATH } else { Join-Path (Split-Path -Parent $PSScriptRoot) 'as-cli.exe' }),
    [string]$ProjectPath = $(if ($env:AS_PROJECT) { $env:AS_PROJECT } else { Join-Path (Split-Path -Parent $PSScriptRoot) 'DevOpsDemo.apj' }),
    [string]$Ip = $(if ($env:AS_PLC_IP) { $env:AS_PLC_IP } else { '127.0.0.1' })
)

function Invoke-Cli {
    param(
        [Parameter(Mandatory = $true)][string[]]$CliArgs,
        [int]$CommandTimeoutMs = $TimeoutMs
    )

    $arguments = @('--project', $ProjectPath, '--timeout', "$CommandTimeoutMs", '--format', 'json') + $CliArgs
    $output = (& $AsCliPath @arguments 2>&1 | Out-String).Trim()
    return [pscustomobject]@{
        Exit = $LASTEXITCODE
        Output = $output
    }
}

function Invoke-Read {
    $stopwatch = [System.Diagnostics.Stopwatch]::StartNew()
    $result = Invoke-Cli -CliArgs @('var', 'read', $Variable, '--task', $Task)
    $stopwatch.Stop()

    if ($result.Exit -ne 0) {
        throw "var read failed with exit $($result.Exit): $($result.Output)"
    }

    return $stopwatch.Elapsed.TotalMilliseconds
}

if (-not (Test-Path -LiteralPath $ProjectPath)) {
    throw "AS project not found: $ProjectPath"
}
if (-not (Test-Path -LiteralPath $AsCliPath)) {
    throw "as-cli was not found: $AsCliPath"
}

$connected = $false
try {
    Write-Host 'as-cli variable read benchmark'
    Write-Host '============================='
    Write-Host "Variable: $Variable"
    Write-Host "Task: $Task"
    Write-Host "Iterations: $Iterations (warmup: $WarmupIterations)"

    $connectArgs = @('plc', 'connect', '--ip', $Ip)
    if ($env:AS_PLC_PORT) { $connectArgs += @('--port', $env:AS_PLC_PORT) }
    $connect = Invoke-Cli -CliArgs $connectArgs
    if ($connect.Exit -ne 0) {
        throw "PLC connect failed with exit $($connect.Exit): $($connect.Output)"
    }
    $connected = $true

    for ($index = 1; $index -le $WarmupIterations; $index++) {
        Invoke-Read | Out-Null
    }

    $samples = New-Object System.Collections.Generic.List[double]
    $benchmarkStopwatch = [System.Diagnostics.Stopwatch]::StartNew()
    for ($index = 1; $index -le $Iterations; $index++) {
        $samples.Add([double](Invoke-Read))
    }
    $benchmarkStopwatch.Stop()

    $sortedSamples = @($samples | Sort-Object)
    $count = $sortedSamples.Count
    $sum = ($sortedSamples | Measure-Object -Sum).Sum
    $median = if ($count % 2 -eq 0) {
        ($sortedSamples[($count / 2) - 1] + $sortedSamples[$count / 2]) / 2
    } else {
        $sortedSamples[[int][Math]::Floor($count / 2)]
    }
    $p95Index = [int][Math]::Ceiling($count * 0.95) - 1
    $p95Index = [Math]::Max(0, [Math]::Min($p95Index, $count - 1))
    $average = $sum / $count

    Write-Host ''
    Write-Host ('Total timed time: {0:N2} ms' -f $benchmarkStopwatch.Elapsed.TotalMilliseconds)
    Write-Host ('Read time, min:   {0:N2} ms' -f $sortedSamples[0])
    Write-Host ('Read time, avg:   {0:N2} ms' -f $average)
    Write-Host ('Read time, median:{0,8:N2} ms' -f $median)
    Write-Host ('Read time, p95:   {0:N2} ms' -f $sortedSamples[$p95Index])
    Write-Host ('Read time, max:   {0:N2} ms' -f $sortedSamples[$count - 1])
    Write-Host ('Reads per second: {0:N2}' -f (1000 / $average))
}
finally {
    if ($connected) {
        Invoke-Cli -CliArgs @('plc', 'disconnect') -CommandTimeoutMs 30000 | Out-Null
    }
}
