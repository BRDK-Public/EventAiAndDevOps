#requires -Version 5.1
<#
.SYNOPSIS
    Collects local diagnostics for Remote Desktop, ICMP, certificates, and network adapters.

.EXAMPLE
    .\tests\diagnose-remote-access.ps1
    .\tests\diagnose-remote-access.ps1 -SinceDays 7
#>
[CmdletBinding()]
param(
    [ValidateRange(1, 30)]
    [int]$SinceDays = 2
)

$since = (Get-Date).AddDays(-$SinceDays)
$rdpRegistryPath = 'HKLM:\SYSTEM\CurrentControlSet\Control\Terminal Server\WinStations\RDP-Tcp'

function Write-Section {
    param([Parameter(Mandatory = $true)][string]$Title)

    Write-Host "`n=== $Title ==="
}

function Get-EventLogEntries {
    param(
        [Parameter(Mandatory = $true)][string]$LogName,
        [string[]]$Providers
    )

    try {
        $events = Get-WinEvent -FilterHashtable @{ LogName = $LogName; StartTime = $since } -ErrorAction Stop
        if ($Providers) {
            $events = $events | Where-Object { $_.ProviderName -in $Providers }
        }
        $events |
            Select-Object -First 40 TimeCreated, ProviderName, Id, LevelDisplayName, Message |
            Format-List
    }
    catch {
        Write-Warning "Could not read ${LogName}: $($_.Exception.Message)"
    }
}

Write-Section 'Identity and Time'
hostname
Get-Date
w32tm /query /status

Write-Section 'Network Adapters'
Get-NetAdapter |
    Format-Table Name, Status, LinkSpeed, MacAddress, DriverDescription -AutoSize

Write-Section 'IPv4 Configuration'
Get-NetIPConfiguration |
    Format-List InterfaceAlias, IPv4Address, IPv4DefaultGateway, NetProfile

Write-Section 'RDP Services and Listener'
Get-Service TermService, UmRdpService |
    Format-Table Name, Status, StartType -AutoSize
Get-NetTCPConnection -LocalPort 3389 -ErrorAction SilentlyContinue |
    Format-Table LocalAddress, LocalPort, State, OwningProcess -AutoSize

Write-Section 'RDP Certificate Binding'
Get-ItemProperty $rdpRegistryPath -Name SSLCertificateSHA1Hash -ErrorAction SilentlyContinue |
    Format-List SSLCertificateSHA1Hash

Write-Section 'RDP Certificate Store'
Get-ChildItem 'Cert:\LocalMachine\Remote Desktop' -ErrorAction SilentlyContinue |
    Format-List Subject, Thumbprint, NotBefore, NotAfter, HasPrivateKey

Write-Section "System TLS and RDP Events Since $since"
Get-EventLogEntries -LogName 'System' -Providers @(
    'Schannel',
    'TermService',
    'Microsoft-Windows-TerminalServices-RemoteConnectionManager'
)

Write-Section "RDP Connection Manager Events Since $since"
Get-EventLogEntries -LogName 'Microsoft-Windows-TerminalServices-RemoteConnectionManager/Operational'

Write-Section 'ICMP Echo Firewall Rule'
$icmpRule = Get-NetFirewallRule -Name 'FPS-ICMP4-ERQ-In' -ErrorAction SilentlyContinue
if ($icmpRule) {
    $icmpRule |
        Format-Table Name, Enabled, Profile, Direction, Action -AutoSize
    $icmpRule |
        Get-NetFirewallPortFilter |
        Format-Table Protocol, LocalPort, RemotePort -AutoSize
}
else {
    Write-Warning 'The built-in IPv4 ICMP echo firewall rule was not found.'
}