# Get operating system information
$osInfo = Get-WmiObject -Class Win32_OperatingSystem
$osName = $osInfo.Name
$osVersion = $osInfo.Version
$osServicePack = $osInfo.ServicePackMajorVersion

# Get installed software information
$software = Get-WmiObject -Class Win32_Product | Select-Object Name, Version, Vendor

# Get network configuration information
$networkAdapter = Get-WmiObject -Class Win32_NetworkAdapterConfiguration | Where-Object { $_.IPEnabled -eq $true }
$ipAddress = $networkAdapter.IPAddress
$subnetMask = $networkAdapter.IPSubnet
$defaultGateway = $networkAdapter.DefaultIPGateway
$dnsServers = $networkAdapter.DNSServerSearchOrder

# Display gathered information
Write-Host "Operating System:"
Write-Host "Name: $osName"
Write-Host "Version: $osVersion"
Write-Host "Service Pack: $osServicePack"
Write-Host

Write-Host "Installed Software:"
$software | Format-Table -AutoSize
Write-Host

Write-Host "Network Configuration:"
Write-Host "IP Address: $ipAddress"
Write-Host "Subnet Mask: $subnetMask"
Write-Host "Default Gateway: $defaultGateway"
Write-Host "DNS Servers: $dnsServers"
