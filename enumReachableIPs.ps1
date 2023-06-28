# PowerShell script that you can use to enumerate reachable IP addresses within a given network range

$subnet = "10.0.0."
$rangeStart = 1
$rangeEnd = 255

$liveIPs = @()

Write-Host "Scanning network range..."

for ($i = $rangeStart; $i -le $rangeEnd; $i++) {
    $ip = $subnet + $i

    $pingResult = Test-Connection -ComputerName $ip -Count 1 -Quiet -ErrorAction SilentlyContinue

    if ($pingResult) {
        $liveIPs += $ip
    }
}

Write-Host "Live IP Addresses:"
$liveIPs
