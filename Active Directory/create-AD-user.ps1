# Script to create a new user in Active Directory interactively

clear

$givenName              = Read-Host "Enter first name"
$surname                = Read-Host "Enter last name"
$email                  = Read-Host "Enter an email"
$upn                    = Read-Host "Enter User Principle Name"
$OU                     = Read-Host "Enter user OU"
$title                  = Read-Host "Enter a job title (press Enter for none)"
$department             = Read-Host "Enter a department (press Enter for none)"
$initialPass            = Read-Host -AsSecureString "Enter an initial password"
$changePassOnFirstLogin = Read-Host "Change password at first login? Y/n"
$enabled                = Read-Host "Enable this account? Y/n"

# Create the parameters hashtable with mandatory values
$parameters = @{
    GivenName             = $givenName
    Surname               = $surname
    Name                  = $givenName + " " + $surname
    EmailAddress          = $email
    UserPrincipalName     = $upn
    Path                  = $OU
    AccountPassword       = $initialPass
    ChangePasswordAtLogon = $changePassOnFirstLogin.ToLower()
}

# Add optional values if provided
if (![string]::IsNullOrEmpty($department)) {
    $parameters["Department"] = $department
}

if (![string]::IsNullOrEmpty($title)) {
    $parameters["Title"] = $title
}

# Necessary to convert the parameter to a Nullable Boolean, else Powershell will treat it as a string when passing it to the command
if ($changePassOnFirstLogin -eq "y") {
    $parameters["ChangePasswordAtLogon"] = [Nullable[bool]]::new($true)
} elseif ($changePassOnFirstLogin -eq "n") {
    $parameters["ChangePasswordAtLogon"] = [Nullable[bool]]::new($false)
}

if ($enabled.ToLower() -eq "y") {
    $parameters["Enabled"] = [Nullable[bool]]::new($true)
} elseif ($enabled.ToLower() -eq "n") {
    $parameters["Enabled"] = [Nullable[bool]]::new($false)
}

# Create the AD user without confirmation
New-ADUser @parameters -PassThru -Confirm:$false

Write-Host "Done."
