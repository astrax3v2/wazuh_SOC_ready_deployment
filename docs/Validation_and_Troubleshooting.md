# Validation and Troubleshooting Guide

## Agent Shows Disconnected

Check:

1. Is the endpoint powered on?
2. Is Wazuh agent service running?
3. Can the endpoint reach manager TCP 1514?
4. Can the endpoint resolve the Wazuh Manager FQDN?
5. Is there a firewall, VPN, EDR, or NAT block?
6. Is the agent key valid?
7. Is the agent name duplicated?
8. Is time synchronization working?

## Windows Validation

```powershell
Get-Service WazuhSvc
Test-NetConnection WAZUH_MANAGER_FQDN_OR_IP -Port 1514
Test-NetConnection WAZUH_MANAGER_FQDN_OR_IP -Port 1515
Get-Content "C:\Program Files (x86)\ossec-agent\ossec.log" -Tail 80
```

## Linux Validation

```bash
sudo systemctl status wazuh-agent
nc -vz WAZUH_MANAGER_FQDN_OR_IP 1514
nc -vz WAZUH_MANAGER_FQDN_OR_IP 1515
sudo tail -n 80 /var/ossec/logs/ossec.log
```

## macOS Validation

```bash
sudo /Library/Ossec/bin/wazuh-control status
nc -vz WAZUH_MANAGER_FQDN_OR_IP 1514
nc -vz WAZUH_MANAGER_FQDN_OR_IP 1515
sudo tail -n 80 /Library/Ossec/logs/ossec.log
```

## Re-Enroll Agent

### Linux

```bash
sudo systemctl stop wazuh-agent
sudo /var/ossec/bin/agent-auth -m WAZUH_MANAGER_FQDN_OR_IP -A UNIQUE_AGENT_NAME
sudo systemctl restart wazuh-agent
```

### Windows

```powershell
Stop-Service WazuhSvc
& "C:\Program Files (x86)\ossec-agent\agent-auth.exe" -m WAZUH_MANAGER_FQDN_OR_IP -A UNIQUE_AGENT_NAME
Restart-Service WazuhSvc
```

### macOS

```bash
sudo /Library/Ossec/bin/wazuh-control stop
sudo /Library/Ossec/bin/agent-auth -m WAZUH_MANAGER_FQDN_OR_IP -A UNIQUE_AGENT_NAME
sudo /Library/Ossec/bin/wazuh-control start
```
