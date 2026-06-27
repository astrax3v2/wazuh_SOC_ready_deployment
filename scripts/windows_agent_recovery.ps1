# Run as Administrator
# Purpose: Make Wazuh Windows agent auto-starting and auto-recovering.

Set-Service -Name WazuhSvc -StartupType Automatic
Start-Service -Name WazuhSvc

# Restart service automatically on first, second, and subsequent failure.
sc.exe failure WazuhSvc reset= 86400 actions= restart/60000/restart/60000/restart/60000
sc.exe config WazuhSvc start= auto

Write-Host "WazuhSvc recovery configuration completed."
Get-Service -Name WazuhSvc
