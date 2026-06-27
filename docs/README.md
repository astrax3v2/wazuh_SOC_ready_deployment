# Wazuh SOC-Ready Agent Deployment Package

This package contains production-ready configuration templates and deployment support files for Wazuh agents on:

- Windows
- Linux
- macOS

It is designed for SOC monitoring, agent auto-recovery, endpoint telemetry collection, file integrity monitoring, SCA, syscollector, and operational validation.

---

## Package Contents

```text
configs/
  ossec_windows_soc_ready.conf
  ossec_linux_soc_ready.conf
  ossec_macos_soc_ready.conf

scripts/
  windows_agent_recovery.ps1
  windows_audit_policy_enable.cmd
  linux_agent_recovery.sh
  linux_auditd_soc_rules.rules
  macos_agent_recovery.sh
  validate_wazuh_agent_windows.ps1
  validate_wazuh_agent_linux.sh
  validate_wazuh_agent_macos.sh

docs/
  SOC_Log_Source_Matrix.md
  Deployment_Checklist.md
  Validation_and_Troubleshooting.md
```

---

## Before Deployment

Replace this placeholder in all config files:

```text
WAZUH_MANAGER_FQDN_OR_IP
```

with your real Wazuh Manager IP or FQDN.

Example:

```text
10.10.10.50
```

or:

```text
wazuh-manager.company.local
```

---

## Deployment Paths

### Windows

Copy:

```text
configs/ossec_windows_soc_ready.conf
```

to:

```text
C:\Program Files (x86)\ossec-agent\ossec.conf
```

Then run PowerShell as Administrator:

```powershell
Restart-Service WazuhSvc
```

### Linux

Copy:

```text
configs/ossec_linux_soc_ready.conf
```

to:

```text
/var/ossec/etc/ossec.conf
```

Then run:

```bash
sudo systemctl restart wazuh-agent
```

### macOS

Copy:

```text
configs/ossec_macos_soc_ready.conf
```

to:

```text
/Library/Ossec/etc/ossec.conf
```

Then run:

```bash
sudo /Library/Ossec/bin/wazuh-control restart
```

---

## Production Notes

This configuration makes Wazuh agents auto-recovering when the endpoint and network are available. It cannot prevent disconnection when the endpoint is powered off, sleeping, isolated from the network, blocked by firewall, or when the Wazuh manager is unavailable.

Recommended production baseline:

- Use TCP 1514 for agent communication
- Enable service auto-start
- Configure OS-level service recovery
- Enable Windows audit policy
- Install Sysmon on Windows endpoints
- Enable auditd on Linux servers
- Tune FIM paths based on endpoint role
- Validate events in Wazuh Dashboard after deployment
