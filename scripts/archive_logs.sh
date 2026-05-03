#!/bin/bash

set -euo pipefail

LOG_DIR="logs"
BACKUP_ROOT="backups"
TIMESTAMP=$(date +"%Y%m%d_%H%M%S")
ZIP_FILE="$BACKUP_ROOT/civicaid_logs_$TIMESTAMP.zip"

mkdir -p "$BACKUP_ROOT"

if [ ! -d "$LOG_DIR" ]; then
    echo "[ERROR] Log directory not found: $LOG_DIR"
    exit 1
fi

zip -r "$ZIP_FILE" "$LOG_DIR" >/dev/null

echo "[OK] Log archive created: $ZIP_FILE"
