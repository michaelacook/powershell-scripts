# Interactive script to create new OUs under the parent OU the administrator specifies

clear

# array to hold OUs provided by user
$inputItems = @()

do 
{
    $input = Read-Host "Enter an OU name, or press Enter to finish"

    # determine whether input is null or empty
    if (![string]::IsNullOrEmpty($input)) {
        $inputItems += $input
    }
  # do once, keep doing until user provides null or empty input
} while (![string]::IsNullOrEmpty($input))

$path = Read-Host "Provide the Distinguished Name for the OUs (OU=ParentOU,DC=domain,DC=com)"

foreach ($item in $inputItems) 
{
    New-ADOrganizationalUnit -Name $item -Path $path -ProtectedFromAccidentalDeletion:$true
}

Write-Host "Done."