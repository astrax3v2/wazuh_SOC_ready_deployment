#!/bin/bash
# Purpose: Validate Wazuh macOS agent service, connectivity, and logs.

MANAGER="WAZUH_MANAGER_FQDN_OR_IP"

echo "[+] Checking Wazuh agent status"
/Library/Ossec/bin/wazuh-control status

echo "[+] Checking TCP 1514"
nc -vz "$MANAGER" 1514 || true

echo "[+] Checking TCP 1515"
nc -vz "$MANAGER" 1515 || true

echo "[+] Last 80 lines of Wazuh agent log"
tail -n 80 /Library/Ossec/logs/ossec.log

echo "[+] Checking common macOS logs"
ls -l /var/log/system.log /var/log/install.log /var/log/wifi.log /var/audit/current 2>/dev/null || true
