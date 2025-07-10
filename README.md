📈 Disk Space Monitor
A lightweight Bash disk usage monitoring script that logs disk usage with timestamps and can send email alerts if specified usage thresholds are exceeded.

🚀 Features
✅ Monitors specified partitions (default: /).
✅ Logs usage with timestamps.
✅ Configurable warning and critical thresholds.
✅ Optional email alerts.
✅ Can be scheduled using cron for automated monitoring.

⚙️ Usage
1️⃣ Make the script executable:
```bash
chmod +x disk_space_monitor.sh

2️⃣ Run manually:
```bash
./disk_space_monitor.sh

3️⃣ Environment Variables (Optional):

Customize behavior without modifying the script:
| Variable       | Description                             | Default                           |
| -------------- | --------------------------------------- | --------------------------------- |
| `PARTITIONS`   | Partitions to monitor (space-separated) | `/`                               |
| `WARNING`      | Warning threshold (percentage)          | `80`                              |
| `CRITICAL`     | Critical threshold (percentage)         | `90`                              |
| `EMAIL`        | Email to send alerts to                 | (empty)                           |
| `LOG_FILE`     | Path to the log file                    | `/var/log/disk_space_monitor.log` |
| `EXCLUDE_LIST` | Partitions to exclude from monitoring   | (empty)                           |


Example:
```bash
PARTITIONS="/ /var /home" WARNING=75 CRITICAL=90 EMAIL="admin@domain.com" ./disk_space_monitor.sh

🛠 Setting up Cron for Automated Monitoring
To run the script daily at 3:00 AM:
crontab -e

Add:
0 3 * * * /path/to/disk_space_monitor.sh

Or, using environment variables:
0 3 * * * PARTITIONS="/ /var" WARNING=80 CRITICAL=90 EMAIL="admin@domain.com" /path/to/disk_space_monitor.sh

🪵 Logs
Logs are written with timestamps to:
```bash
/var/log/disk_space_monitor.log

You can customize the log file location by setting the LOG_FILE environment variable.

✉️ Email Alerts
If EMAIL is set, the script will send email alerts when usage exceeds WARNING or CRITICAL thresholds using the system mail or mailx utility.
Ensure your system can send emails (e.g., mailutils installed and configured).

🤝 Contributing
Feel free to fork, improve, and submit Pull Requests.
Ideas for improvement:

Slack or Telegram notifications

CSV or JSON log options

Graph generation for historical disk usage

