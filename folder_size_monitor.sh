#!/bin/bash

# Folders to monitor
FOLDERS_TO_MONITOR=(
    "/mnt/c"
    "/mnt/d"
    "/mnt/e"
    "/mnt/g"
)

# Output file
OUTPUT_FILE=~/folder_size_monitor.log

echo "-----------------------------" >> "$OUTPUT_FILE"
echo "$(date '+%Y-%m-%d %H:%M:%S') - Folder sizes:" >> "$OUTPUT_FILE"

for folder in "${FOLDERS_TO_MONITOR[@]}"; do
    echo "Checking folder: $folder" >> "$OUTPUT_FILE"
    
    if [ -d "$folder" ]; then
        # Total folder size
        du -sh "$folder" 2>/dev/null >> "$OUTPUT_FILE"

        # Subfolder sizes
        find "$folder" -mindepth 1 -maxdepth 1 -type d 2>/dev/null | while read subfolder; do
            du -sh "$subfolder" 2>/dev/null
        done | sort -hr >> "$OUTPUT_FILE"

        # Disk free space – more robust
        disk_info=$(df -h "$folder" 2>/dev/null | awk 'NR==2')
        if [ -n "$disk_info" ]; then
            mp=$(echo "$disk_info" | awk '{print $6}')
            avail=$(echo "$disk_info" | awk '{print $4}')
            size=$(echo "$disk_info" | awk '{print $2}')
            echo "Free space on $mp: $avail available of $size" >> "$OUTPUT_FILE"
        else
            echo "Could not retrieve free space for $folder" >> "$OUTPUT_FILE"
        fi
    else
        echo "Folder $folder does not exist." >> "$OUTPUT_FILE"
    fi

    echo "-----------------------------" >> "$OUTPUT_FILE"
done

