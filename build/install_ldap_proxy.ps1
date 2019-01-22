# Import required modules
Import-Module ServerManager
Import-Module NetSecurity

# Install Duo LDAP Proxy
Start-Process "C:\build\duoauthproxy-2.12.0.exe" -argumentlist "/S" -wait

# Stop Duo LDAP Proxy to deploy configuration file
Stop-Service DuoAuthProxy

# Execute update of variables from AWS Secrets Manager
set +x
$ldap_settings  = (Get-SECSecretValue -SecretId 'prod-ldap-proxy-credentials').SecretString | ConvertFrom-Json
$current_settings = @("HOST1", "HOST2", "SERVICE_ACCOUNT_USERNAME", "SERVICE_ACCOUNT_PASSWORD", "SEARCH_DN", "INTEGRATION_KEY", "SECRET_KEY", "API_HOST", "EXEMPT_OU_1")
foreach ($setting in $current_settings){
  (Get-Content "C:\build\authproxy.cfg").replace($setting, $ldap_settings.$setting) | Set-Content C:\Build\authproxy.cfg
}

# Add authproxy.cfg to correct path
Copy-Item -Path C:\build\authproxy.cfg -Destination "C:\Program Files (x86)\Duo Security Authentication Proxy\conf"

# Restart Duo LDAP Proxy after configuration file update
Start-Service DuoAuthProxy

# Open LDAP/LDAPS firewall ports
New-NetFirewallRule -DisplayName "Allow LDAP" -Direction Inbound -Action Allow -LocalPort 389 -Protocol TCP
New-NetFirewallRule -DisplayName "Allow LDAPS" -Direction Outbound -Action Allow -LocalPort 636 -Protocol TCP

# Remove all build assets
Remove-Item -Path C:\build -Force -Recurse 
