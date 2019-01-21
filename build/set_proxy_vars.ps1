Write-Host "Configuring LDAP Proxy Settings"
Write-Host "Configuring Secret Key"
(Get-Content c:\build\authproxy.cfg ).replace('SKEY', $Env:SKEY) | Set-Content c:\build\authproxy.cfg
Write-Host "Configuring Integration Key"
(Get-Content c:\build\authproxy.cfg ).replace('IKEY', $Env:IKEY) | Set-Content c:\build\authproxy.cfg
Write-Host "Configuring API Host"
(Get-Content c:\build\authproxy.cfg ).replace('API_HOST', $Env:API_HOST) | Set-Content c:\build\authproxy.cfg
Write-Host "Configuring AD Host 1"
(Get-Content c:\build\authproxy.cfg ).replace('HOST1', $Env:HOST1) | Set-Content c:\build\authproxy.cfg
Write-Host "Configuring AD Host 2"
(Get-Content c:\build\authproxy.cfg ).replace('HOST2', $Env:HOST2) | Set-Content c:\build\authproxy.cfg
Write-Host "Configuring Service Account User"
(Get-Content c:\build\authproxy.cfg ).replace('SERVICE_ACCOUNT_USER', $Env:SERVICE_ACCOUNT_USER) | Set-Content c:\build\authproxy.cfg
Write-Host "Configuring Service Account Pass"
(Get-Content c:\build\authproxy.cfg ).replace('SERVICE_ACCOUNT_PASS', $Env:SERVICE_ACCOUNT_PASS) | Set-Content c:\build\authproxy.cfg
Write-Host "Configuring Search DN"
(Get-Content c:\build\authproxy.cfg ).replace('SEARCHDN', $Env:SEARCHDN) | Set-Content c:\build\authproxy.cfg
