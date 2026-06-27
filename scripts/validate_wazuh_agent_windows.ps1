# Run as Administrator
# Purpose: Validate Wazuh Windows agent service, connectivity, and logs.

$Manager = "WAZUH_MANAGER_FQDN_OR_IP"

Write-Host "Checking Wazuh service..."
Get-Service WazuhSvc

Write-Host "Checking TCP 1514..."
Test-NetConnection $Manager -Port 1514

Write-Host "Checking TCP 1515..."
Test-NetConnection $Manager -Port 1515

Write-Host "Last 80 lines of Wazuh agent log..."
Get-Content "C:\Program Files (x86)\ossec-agent\ossec.log" -Tail 80

Write-Host "Checking recent Security events..."
Get-WinEvent -LogName Security -MaxEvents 5 | Select-Object TimeCreated, Id, ProviderName, Message
