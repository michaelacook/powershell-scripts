# A sample script for doing basic user operations with groups and OUs

# Creating a new organizational unit
New-ADOrganizationalUnit -Name "Toronto" -Path "dc=mcook,dc=local" -DisplayName "Toronto Office"

# Creating a new security group
New-ADGroup -Name "CybersecurityOperators" -GroupScope Global -Path "ou=IT,dc=mcook,dc=local" -DisplayName

# Add a user to a group using Distinguished Name
Add-ADGroupMember -Identity "CybersecurityOperators" -Members

# Get a user by SAM account
Get-ADUser -Filter "SamAccountName -like 'Lacey Oliviera'"

# Get a user by SAM account with all account properties
Get-ADUser -Identity "Lacey Oliviera" -Properties *

# Add a user by SAM account to a group
Add-ADGroupMember -Identity "IT Operations" -Members "Lacey Oliviera"

# Move a user created in the default Users OU to another OU
Move-ADObject -Identity "cn=johnny,cn=users,dc=mcook,dc=local" -TargetPath "ou=ServiceDesk,ou=it,dc=mcook,dc=local"