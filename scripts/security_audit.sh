#!/bin/bash

set -euo pipefail

REPORT_FILE="reports/security_audit_report.txt"

mkdir -p reports

{
    echo "CivicAid Security Audit Report"
    echo "Generated on: $(date)"
    echo ""

    echo "1. Checking Git ignore rules:"
    if grep -q "config/app.env" .gitignore; then
        echo "[OK] config/app.env is ignored"
    else
        echo "[WARNING] config/app.env is not ignored"
    fi

    if grep -q ".venv/" .gitignore; then
        echo "[OK] .venv/ is ignored"
    else
        echo "[WARNING] .venv/ is not ignored"
    fi

    echo ""
    echo "2. Checking config permissions:"
    ls -l config 2>/dev/null || echo "config folder missing"

    echo ""
    echo "3. Checking script permissions:"
    ls -l scripts/*.sh 2>/dev/null || echo "No shell scripts found"

    echo ""
    echo "4. Searching for risky secret keywords:"
    grep -RniE "password|secret|api_key|token|private_key|apikey" . \
      --exclude-dir=.git \
      --exclude-dir=.venv \
      --exclude="$REPORT_FILE" || echo "[OK] No risky keywords found"

    echo ""
    echo "5. Security reminders:"
    echo "- Never commit real .env files"
    echo "- Never share private SSH keys"
    echo "- Use sudo only when needed"
    echo "- Keep scripts executable only when needed"
    echo "- Keep local secrets chmod 600"
} > "$REPORT_FILE"

echo "[OK] Security audit completed: $REPORT_FILE"
