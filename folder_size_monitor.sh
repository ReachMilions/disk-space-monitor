#!/bin/bash

# Folder to monitor
DIR_TO_MONITOR="/home/janku"

# Output file
OUTPUT_FILE=~/folder_sizes.log

echo "$(date '+%Y-%m-%d %H:%M:%S') - Folder sizes:" >> "$OUTPUT_FILE"
du -sh "$DIR_TO_MONITOR"/* | sort -hr >> "$OUTPUT_FILE"
echo "-----------------------------" >> "$OUTPUT_FILE"
