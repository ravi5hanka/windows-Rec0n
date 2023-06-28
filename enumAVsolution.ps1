# Security solution information (example: antivirus software)
Get-WmiObject -Namespace "root\SecurityCenter2" -Class AntiVirusProduct | Select-Object DisplayName, PathToSignedProductExe
