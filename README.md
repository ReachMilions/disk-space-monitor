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
2. Run the script:
    ./disk_space_monitor.sh
3. Check the log file (by default /var/log/disk_space_monitor.log).

Why I built this
I created this small project to start building my GitHub portfolio, practice Bash scripting, and create a useful tool for system administration monitoring tasks.

What I learned
- Using df -h to check disk usage

- Writing Bash scripts with timestamping

- Appending outputs to a log file for tracking

- Pushing code to GitHub and creating a project README

How to set up cron?

  crontab -e
  # add every day at 3:00
  0 3 * * * /cesta/k/disk_space_monitor.sh
