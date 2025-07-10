#!/bin/bash

# disk_space_monitor.sh
# This script checks disk usage and writes it to a log file with timestamp

LOGFILE="/var/log/disk_space_monitor.log"
echo "Disk space report on $(date)" >> $LOGFILE
df -h >> $LOGFILE
echo "---------------------------------" >> $LOGFILE
