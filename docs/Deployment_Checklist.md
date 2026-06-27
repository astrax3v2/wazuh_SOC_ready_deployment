# Wazuh SOC Deployment Checklist

## Pre-Deployment

- [ ] Confirm Wazuh Manager IP/FQDN.
- [ ] Confirm TCP 1514 is open from agents to manager.
- [ ] Confirm TCP 1515 is open for enrollment.
- [ ] Confirm endpoint DNS resolution.
- [ ] Confirm endpoint time synchronization/NTP.
- [ ] Confirm unique endpoint hostname or agent name.

## Windows

- [ ] Replace WAZUH_MANAGER_FQDN_OR_IP in Windows config.
- [ ] Copy config to C:\Program Files (x86)\ossec-agent\ossec.conf.
- [ ] Enable WazuhSvc automatic startup.
- [ ] Apply service recovery configuration.
- [ ] Enable Windows audit policy.
- [ ] Enable PowerShell logging.
- [ ] Install Sysmon if required.
- [ ] Restart WazuhSvc.
- [ ] Validate events in Wazuh Dashboard.

## Linux

- [ ] Replace WAZUH_MANAGER_FQDN_OR_IP in Linux config.
- [ ] Copy config to /var/ossec/etc/ossec.conf.
- [ ] Enable wazuh-agent service.
- [ ] Apply systemd recovery override.
- [ ] Install and enable auditd.
- [ ] Apply Linux audit rules.
- [ ] Restart wazuh-agent.
- [ ] Validate events in Wazuh Dashboard.

## macOS

- [ ] Replace WAZUH_MANAGER_FQDN_OR_IP in macOS config.
- [ ] Copy config to /Library/Ossec/etc/ossec.conf.
- [ ] Load LaunchDaemon.
- [ ] Restart Wazuh agent.
- [ ] Validate events in Wazuh Dashboard.

## SOC Validation

- [ ] Agent status is Active.
- [ ] Authentication events received.
- [ ] PowerShell/Sysmon events received for Windows.
- [ ] auditd events received for Linux.
- [ ] FIM events received.
- [ ] Syscollector inventory visible.
- [ ] SCA results visible.
- [ ] Disconnection/reconnection behavior tested.
