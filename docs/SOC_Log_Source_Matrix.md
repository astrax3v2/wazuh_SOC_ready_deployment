# SOC Log Source Matrix

| Platform | Required Logs | Purpose |
|---|---|---|
| Windows Workstation | Security, System, Application | Authentication, system changes, application errors |
| Windows Workstation | PowerShell Operational, Windows PowerShell | Script execution, suspicious commands |
| Windows Workstation | Sysmon Operational | Process, network, registry, DNS, file telemetry |
| Windows Workstation | Defender Operational | Malware, AV actions, protection status |
| Windows Server | Security, System, Application | Server authentication and system visibility |
| Windows Server | Task Scheduler, WMI, WinRM | Persistence and lateral movement |
| Domain Controller | Security, Directory Service, DNS Server, DFS Replication | AD changes, DNS visibility, replication issues |
| Linux Server | /var/log/auth.log or /var/log/secure | SSH, sudo, authentication |
| Linux Server | /var/log/syslog or /var/log/messages | System events |
| Linux Server | /var/log/audit/audit.log | Privilege, file, process, kernel monitoring |
| Linux Web Server | Apache/Nginx access and error logs | Web attack and access visibility |
| Linux DB Server | MySQL/MariaDB/PostgreSQL logs | Database failure and suspicious activity |
| macOS | /var/log/system.log, /var/log/install.log, /var/log/wifi.log | System, installation, Wi-Fi visibility |
| macOS | /var/audit/current | Audit trail |
