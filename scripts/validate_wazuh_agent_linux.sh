#!/bin/bash
# Purpose: Validate Wazuh Linux agent service, connectivity, and logs.

MANAGER="WAZUH_MANAGER_FQDN_OR_IP"

echo "[+] Checking Wazuh agent service"
systemctl status wazuh-agent --no-pager

echo "[+] Checking TCP 1514"
nc -vz "$MANAGER" 1514 || true

echo "[+] Checking TCP 1515"
nc -vz "$MANAGER" 1515 || true

echo "[+] Last 80 lines of Wazuh agent log"
tail -n 80 /var/ossec/logs/ossec.log

echo "[+] Checking common logs"
ls -l /var/log/auth.log /var/log/secure /var/log/syslog /var/log/messages /var/log/audit/audit.log 2>/dev/null || true
