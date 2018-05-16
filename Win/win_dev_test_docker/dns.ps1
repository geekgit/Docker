Get-NetAdapter -Physical | ForEach-Object {
   $net = $_.Name
   set-dnsclientserveraddress $net -ServerAddresses ("1.1.1.1")
}
Write-Host "OK"