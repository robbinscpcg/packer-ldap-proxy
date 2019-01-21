# Import required modules
Import-Module ServerManager
Import-Module NetSecurity

# Install Duo LDAP Proxy
Start-Process "C:\build\duoauthproxy-2.12.0.exe" -argumentlist "/S" -wait

# Stop Duo LDAP Proxy to deploy configuration file
Stop-Service DuoAuthProxy

# Add authproxy.cfg to correct path
Copy-Item -Path C:\build\authproxy.cfg -Destination "C:\Program Files (x86)\Duo Security Authentication Proxy\conf"

# Restart Duo LDAP Proxy after configuration file update
Start-Service DuoAuthProxy

# Open LDAP/LDAPS firewall ports
New-NetFirewallRule -DisplayName "Allow LDAP" -Direction Inbound -Action Allow -LocalPort 389 -Protocol TCP
New-NetFirewallRule -DisplayName "Allow LDAPS" -Direction Outbound -Action Allow -LocalPort 636 -Protocol TCP

# Remove all build assets
Remove-Item -Path C:\build -Force -Recurse 
