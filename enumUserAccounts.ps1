# Get all local user accounts
$localAccounts = Get-WmiObject -Class Win32_UserAccount

# Create an array to store privileged accounts
$privilegedAccounts = @()

# Loop through each user account
foreach ($account in $localAccounts) {
    # Check if the account has any special privileges
    $userSID = New-Object System.Security.Principal.SecurityIdentifier($account.SID)
    $accountType = $userSID.Translate([System.Security.Principal.NTAccount]).Value
    
    if ($accountType -like "*Administrator*" -or $accountType -like "*Domain Admins*" -or $accountType -like "*Enterprise Admins*") {
        $privilegedAccounts += $account.Name
    }
}

# Display the results
Write-Host "User Accounts with Elevated Permissions:"
Write-Host $privilegedAccounts
