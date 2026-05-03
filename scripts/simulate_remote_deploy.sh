#!/bin/bash

set -euo pipefail

PROJECT_DIR="$HOME/projects/civicaid-linux-command-center"
REMOTE_SIM="$HOME/remote-server-sim"
APP_DIR="$REMOTE_SIM/opt/civicaid"
CONFIG_DIR="$REMOTE_SIM/etc/civicaid"
LOG_DIR="$REMOTE_SIM/var/log/civicaid"
BACKUP_DIR="$REMOTE_SIM/var/backups/civicaid"

echo "Starting CivicAid remote deployment simulation..."

mkdir -p "$APP_DIR" "$CONFIG_DIR" "$LOG_DIR" "$BACKUP_DIR"

rsync -av \
  --exclude '.git' \
  --exclude '.venv' \
  --exclude 'config/app.env' \
  --exclude '*.pid' \
  --exclude 'backups/*.tar' \
  --exclude 'backups/*.tar.gz' \
  --exclude 'backups/*.zip' \
  "$PROJECT_DIR/" "$APP_DIR/" >/dev/null

cp "$PROJECT_DIR/config/app.env.example" "$CONFIG_DIR/app.env.example"

cat > "$CONFIG_DIR/app.env" <<'CONFIG'
# Simulated server config for CivicAid
# Fake/sample values only.

CIVICAID_ENV=production-simulation
CIVICAID_APP_NAME="CivicAid Linux Operations Command Center"
CIVICAID_LOG_LEVEL=info
CIVICAID_BACKUP_DIR=/var/backups/civicaid
CIVICAID_FAKE_API_KEY=server_fake_key_only
CONFIG

chmod 600 "$CONFIG_DIR/app.env"

rsync -av --exclude '*.pid' "$PROJECT_DIR/logs/" "$LOG_DIR/" >/dev/null
cp "$PROJECT_DIR/reports/backup_archive_report.txt" "$BACKUP_DIR/" 2>/dev/null || true

echo "[OK] CivicAid deployment simulation complete."
echo "App directory: $APP_DIR"
echo "Config directory: $CONFIG_DIR"
echo "Log directory: $LOG_DIR"
echo "Backup directory: $BACKUP_DIR"
