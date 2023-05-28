# create group managed service account
# this is something I need to study more to understand
# basically for creating a service account where AD will manage the password for you

# create KDS (key distribution service) root key

# skip 10 hour period for lab purposes
Add-KdsRootKey -EffectiveTime ((Get-Date).AddHours(-10))

# create the gMSA
New-ADServiceAccount -Name TestgMSA -DNSHostName testgmsa.mcook.local -PrincipalsAllowedToDelegateToAccount "Domain Computers"

# for a member server
Add-WindowsFeature rsat-ad-powershell
Import-Module activedirectory
Install-ADServiceAccount -Identity testgmsa