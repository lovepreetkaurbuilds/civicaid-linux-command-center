#!/bin/bash

set -euo pipefail

LOG_FILE="logs/script_activity.log"
STATUS=0

REQUIRED_DIRS=("data" "reports" "logs" "scripts" "src" "tests" "backups" "config" "docs")
REQUIRED_FILES=("README.md" "requirements.txt" "data/help_requests.csv" "src/civicaid.py" "config/app.env.example")
REQUIRED_TOOLS=("git" "python3" "pip3" "tree" "curl" "wget")

log() {
    echo "$(date '+%Y-%m-%d %H:%M:%S') [health_check] $1" | tee -a "$LOG_FILE"
}

check_directories() {
    echo ""
    echo "Checking required directories..."
    for dir in "${REQUIRED_DIRS[@]}"; do
        if [ -d "$dir" ]; then
            echo "[OK] Directory exists: $dir"
        else
            echo "[MISSING] Directory missing: $dir"
            STATUS=1
        fi
    done
}

check_files() {
    echo ""
    echo "Checking required files..."
    for file in "${REQUIRED_FILES[@]}"; do
        if [ -f "$file" ]; then
            echo "[OK] File exists: $file"
        else
            echo "[MISSING] File missing: $file"
            STATUS=1
        fi
    done
}

check_tools() {
    echo ""
    echo "Checking required tools..."
    for tool in "${REQUIRED_TOOLS[@]}"; do
        if command -v "$tool" >/dev/null 2>&1; then
            echo "[OK] Tool found: $tool"
        else
            echo "[MISSING] Tool missing: $tool"
            STATUS=1
        fi
    done
}

mkdir -p logs

log "Starting CivicAid health check."

echo "CivicAid Health Check"
echo "===================="

check_directories
check_files
check_tools

echo ""
if [ "$STATUS" -eq 0 ]; then
    log "[OK] Health check passed."
    echo "[OK] Health check passed."
else
    log "[ERROR] Health check failed."
    echo "[ERROR] Health check failed."
fi

exit "$STATUS"
