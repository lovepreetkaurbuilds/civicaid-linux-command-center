#!/bin/bash

set -euo pipefail

BACKUP_ROOT="backups"
LOG_FILE="logs/script_activity.log"
TIMESTAMP=$(date +"%Y%m%d_%H%M%S")
BACKUP_DIR="$BACKUP_ROOT/civicaid_backup_$TIMESTAMP"
MANIFEST_FILE="$BACKUP_DIR/backup_manifest.txt"

ITEMS_TO_BACKUP=("data" "reports" "scripts" "config/app.env.example" "README.md" "requirements.txt")

log() {
    echo "$(date '+%Y-%m-%d %H:%M:%S') [backup_data] $1" | tee -a "$LOG_FILE"
}

mkdir -p "$BACKUP_DIR" logs

log "Starting backup into $BACKUP_DIR"

for item in "${ITEMS_TO_BACKUP[@]}"; do
    if [ -e "$item" ]; then
        cp -r "$item" "$BACKUP_DIR/"
        log "Backed up: $item"
    else
        log "[WARNING] Skipped missing item: $item"
    fi
done

{
    echo "CivicAid Backup Manifest"
    echo "Created on: $(date)"
    echo "Backup directory: $BACKUP_DIR"
    echo ""
    echo "Items included:"
    for item in "${ITEMS_TO_BACKUP[@]}"; do
        if [ -e "$item" ]; then
            echo "- $item"
        fi
    done
} > "$MANIFEST_FILE"

log "[OK] Backup completed: $BACKUP_DIR"
