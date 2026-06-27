#!/bin/bash
# Run as root or with sudo.
# Purpose: Make Wazuh macOS agent start automatically.

set -e

/Library/Ossec/bin/wazuh-control start || true

if [ -f /Library/LaunchDaemons/com.wazuh.agent.plist ]; then
  launchctl load -w /Library/LaunchDaemons/com.wazuh.agent.plist || true
fi

/Library/Ossec/bin/wazuh-control restart
/Library/Ossec/bin/wazuh-control status

echo "Wazuh macOS agent recovery configuration completed."
