#!/bin/bash

set -euo pipefail

BACKUP_ROOT="backups"
LOG_FILE="logs/script_activity.log"
TIMESTAMP=$(date +"%Y%m%d_%H%M%S")
ARCHIVE_FILE="$BACKUP_ROOT/civicaid_backup_$TIMESTAMP.tar.gz"
MANIFEST_FILE="reports/backup_manifest_$TIMESTAMP.txt"

ITEMS_TO_BACKUP=("data" "reports" "scripts" "config/app.env.example" "README.md" "requirements.txt")

log() {
    echo "$(date '+%Y-%m-%d %H:%M:%S') [backup_data] $1" | tee -a "$LOG_FILE"
}

mkdir -p "$BACKUP_ROOT" logs reports

log "Starting compressed backup."

{
    echo "CivicAid Backup Manifest"
    echo "Created on: $(date)"
    echo "Archive file: $ARCHIVE_FILE"
    echo ""
    echo "Items included:"
    for item in "${ITEMS_TO_BACKUP[@]}"; do
        if [ -e "$item" ]; then
            echo "- $item"
        else
            echo "- MISSING: $item"
        fi
    done
} > "$MANIFEST_FILE"

tar -czf "$ARCHIVE_FILE" "${ITEMS_TO_BACKUP[@]}" "$MANIFEST_FILE"

log "[OK] Compressed backup created: $ARCHIVE_FILE"
echo "[OK] Backup archive created: $ARCHIVE_FILE"
echo "[OK] Backup manifest created: $MANIFEST_FILE"
