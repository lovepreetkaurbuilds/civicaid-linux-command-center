#!/bin/bash

BACKUP_ROOT="backups"
TIMESTAMP=$(date +"%Y%m%d_%H%M%S")
BACKUP_DIR="$BACKUP_ROOT/civicaid_backup_$TIMESTAMP"

echo "Starting CivicAid backup..."

mkdir -p "$BACKUP_DIR"

cp -r data "$BACKUP_DIR/"
cp -r reports "$BACKUP_DIR/"
cp -r scripts "$BACKUP_DIR/"
cp -r config/app.env.example "$BACKUP_DIR/"

echo "[OK] Backup created at: $BACKUP_DIR"
