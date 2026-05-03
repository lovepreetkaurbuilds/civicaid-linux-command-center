#!/bin/bash

set -euo pipefail

REPORT_FILE="reports/error_diagnosis_report.txt"

mkdir -p reports

{
    echo "CivicAid Error Diagnosis Report"
    echo "Generated on: $(date)"
    echo "==============================="
    echo ""

    echo "1. Current folder"
    echo "-----------------"
    pwd
    echo ""

    echo "2. Required command checks"
    echo "--------------------------"

    REQUIRED_COMMANDS=("git" "python3" "pip3" "pytest" "tree" "curl" "wget" "cron" "crontab")

    for cmd in "${REQUIRED_COMMANDS[@]}"; do
        if command -v "$cmd" >/dev/null 2>&1; then
            echo "[OK] $cmd found at $(command -v "$cmd")"
        else
            echo "[MISSING] $cmd not found"
        fi
    done

    echo ""
    echo "3. Required folder checks"
    echo "-------------------------"

    REQUIRED_DIRS=("data" "reports" "logs" "scripts" "src" "tests" "config" "docs")

    for dir in "${REQUIRED_DIRS[@]}"; do
        if [ -d "$dir" ]; then
            echo "[OK] Directory exists: $dir"
        else
            echo "[MISSING] Directory missing: $dir"
        fi
    done

    echo ""
    echo "4. Required file checks"
    echo "-----------------------"

    REQUIRED_FILES=("README.md" "data/help_requests.csv" "src/civicaid.py" "requirements.txt")

    for file in "${REQUIRED_FILES[@]}"; do
        if [ -f "$file" ]; then
            echo "[OK] File exists: $file"
        else
            echo "[MISSING] File missing: $file"
        fi
    done

    echo ""
    echo "5. Script executable checks"
    echo "---------------------------"

    for script in scripts/*.sh; do
        if [ -x "$script" ]; then
            echo "[OK] Executable: $script"
        else
            echo "[WARNING] Not executable: $script"
        fi
    done

    echo ""
    echo "6. Git status"
    echo "-------------"
    git status --short || echo "[WARNING] Git status could not run"

    echo ""
    echo "7. Cron status"
    echo "--------------"
    sudo service cron status 2>/dev/null | head -n 5 || echo "[WARNING] Could not check cron status"

    echo ""
    echo "8. Common fixes"
    echo "---------------"
    echo "command not found → check command -v toolname"
    echo "permission denied → chmod +x script.sh"
    echo "no such file → pwd, ls, check path"
    echo "wrong folder → cd ~/projects/civicaid-linux-command-center"
    echo "python not found → use python3"
    echo "pip not found → use pip3 or activate .venv"
    echo "pytest missing → source .venv/bin/activate"
    echo "git auth failed → gh auth login"
    echo "cron not running → sudo service cron start"

} > "$REPORT_FILE"

echo "[OK] Error diagnosis completed: $REPORT_FILE"
