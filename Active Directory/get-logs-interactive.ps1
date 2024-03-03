clear

$name = Read-Host "Which computer would you like to connect to?"

$log = Read-Host "Which log would you like to see?"

$amount = Read-Host "How many of the newest entries would you like to see?"

Get-EventLog -ComputerName $name -LogName $log -Newest $amount