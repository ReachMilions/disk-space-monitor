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
        # Veľkosť samotného priečinka
        du -sh "$folder" 2>/dev/null >> "$OUTPUT_FILE"

        # Veľkosti podpriečinkov – parametre najskôr, potom cesta
        find "$folder" -mindepth 1 -maxdepth 1 -type d 2>/dev/null | while read subfolder; do
            du -sh "$subfolder" 2>/dev/null
        done | sort -hr >> "$OUTPUT_FILE"
    else
        echo "Folder $folder does not exist." >> "$OUTPUT_FILE"
    fi
    echo "-----------------------------" >> "$OUTPUT_FILE"
done

