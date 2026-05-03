#!/bin/bash

set -euo pipefail

PROJECT_DIR="$HOME/projects/civicaid-linux-command-center"
CRON_LOG="$PROJECT_DIR/logs/cron.log"

mkdir -p "$PROJECT_DIR/logs"

{
    echo "----------------------------------------"
    echo "$(date '+%Y-%m-%d %H:%M:%S') [cron] Starting backup job"
    cd "$PROJECT_DIR"
    ./scripts/backup_data.sh
    echo "$(date '+%Y-%m-%d %H:%M:%S') [cron] Backup job completed"
} >> "$CRON_LOG" 2>&1
