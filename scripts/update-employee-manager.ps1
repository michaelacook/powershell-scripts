# Script continually prompts for usernames to change manager until user hits Enter
# This is useful if you want to update some employees' managers, but not all in the OU

clear

Write-Host "For quickly updating many employees' manager."

$manager = Read-Host "Enter manager username"
$employees = @()

while ($true) {
    $input = Read-Host "Enter employee username or press Enter to quit"
    if ($input -eq "") {
        break
    }
    Set-ADUser -Identity $input -Manager $manager
    $employees += $input
}


foreach ($employee in  $employees) {
# Want to update this to print out a list of all employees and their new manager after user finishes.
}

Write-Host "Done."
