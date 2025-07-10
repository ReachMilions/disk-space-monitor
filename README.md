# Disk Space Monitor

This is a simple Bash script that checks disk usage and writes it to a log file with a timestamp. It helps to monitor free disk space regularly and store history for troubleshooting or capacity planning.

## Features

- Checks disk usage on all mounted partitions
- Appends the report with timestamp to a log file
- Easy to automate with cron for daily/weekly monitoring

## Usage

1. Give execute permission:
   ```bash
   chmod +x disk_space_monitor.sh
