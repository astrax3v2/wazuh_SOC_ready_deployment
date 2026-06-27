#!/bin/bash
# Run as root or with sudo.
# Purpose: Make Wazuh Linux agent auto-starting and auto-recovering.

set -e

systemctl enable wazuh-agent
systemctl start wazuh-agent

mkdir -p /etc/systemd/system/wazuh-agent.service.d

cat > /etc/systemd/system/wazuh-agent.service.d/override.conf <<'EOF'
[Service]
Restart=always
RestartSec=10
StartLimitIntervalSec=0
EOF

systemctl daemon-reload
systemctl restart wazuh-agent
systemctl status wazuh-agent --no-pager

echo "Wazuh Linux agent recovery configuration completed."
