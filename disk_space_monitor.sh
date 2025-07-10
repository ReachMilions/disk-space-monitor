#!/bin/bash

# disk_space_monitor.sh
# This script checks disk usage and writes it to a log file with timestamp

PARTITIONS=${PARTITIONS:-"/"}
WARNING=${WARNING:-80}
CRITICAL=${CRITICAL:-90}
EMAIL=${EMAIL:-""}
EXCLUDE_LIST=${EXCLUDE_LIST:-""}

for fs in $(df -h --output=target,pcent | tail -n +2); do
  mp=$(echo $fs | awk '{print $1}')
  pct=$(echo $fs | awk '{print $2}' | sed 's/%//')
  if [[ " $EXCLUDE_LIST " =~ " $mp " ]]; then
     continue
  fi
  status="OK"
  if (( pct >= CRITICAL )); then status="CRITICAL"
  elif (( pct >= WARNING )); then status="WARNING"
  fi
  ts=$(date '+%Y-%m-%d %H:%M:%S')
  echo "$ts - $mp - ${pct}% - $status" >> "${LOG_FILE:-/var/log/disk_space_monitor.log}"
  if [[ -n $EMAIL && ( $status == "CRITICAL" || $status == "WARNING" ) ]]; then
    echo "$ts - $mp at ${pct}% ($status)" | mail -s "Disk $status on $mp" "$EMAIL"
  fi
done
