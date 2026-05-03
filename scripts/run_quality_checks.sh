#!/bin/bash

set -euo pipefail

REPORT_FILE="reports/quality_check_report.txt"
STATUS=0

mkdir -p reports

{
    echo "CivicAid Quality Check Report"
    echo "Generated on: $(date)"
    echo "============================="
    echo ""

    echo "1. Bash syntax checks"
    echo "---------------------"

    for script in scripts/*.sh; do
        echo "Checking syntax: $script"
        if bash -n "$script"; then
            echo "[OK] Syntax valid: $script"
        else
            echo "[ERROR] Syntax failed: $script"
            STATUS=1
        fi
        echo ""
    done

    echo "2. Required executable script checks"
    echo "------------------------------------"

    REQUIRED_SCRIPTS=(
        "scripts/generate_report.sh"
        "scripts/backup_data.sh"
        "scripts/search_requests.sh"
        "scripts/run_health_check.sh"
        "scripts/security_audit.sh"
        "scripts/civicaid_command_center.sh"
    )

    for script in "${REQUIRED_SCRIPTS[@]}"; do
        if [ -x "$script" ]; then
            echo "[OK] Executable: $script"
        else
            echo "[ERROR] Not executable: $script"
            STATUS=1
        fi
    done

    echo ""
    echo "3. Core script execution checks"
    echo "-------------------------------"

    if ./scripts/generate_report.sh >/dev/null; then
        echo "[OK] generate_report.sh ran successfully"
    else
        echo "[ERROR] generate_report.sh failed"
        STATUS=1
    fi

    if ./scripts/run_health_check.sh >/dev/null; then
        echo "[OK] run_health_check.sh ran successfully"
    else
        echo "[ERROR] run_health_check.sh failed"
        STATUS=1
    fi

    if ./scripts/security_audit.sh >/dev/null; then
        echo "[OK] security_audit.sh ran successfully"
    else
        echo "[ERROR] security_audit.sh failed"
        STATUS=1
    fi

    if ./scripts/generate_summary_reports.sh >/dev/null; then
        echo "[OK] generate_summary_reports.sh ran successfully"
    else
        echo "[ERROR] generate_summary_reports.sh failed"
        STATUS=1
    fi

    echo ""
    echo "4. Python test checks"
    echo "---------------------"

    if command -v pytest >/dev/null 2>&1; then
        if pytest >/tmp/civicaid_pytest_output.txt 2>&1; then
            echo "[OK] pytest passed"
            cat /tmp/civicaid_pytest_output.txt
        else
            echo "[ERROR] pytest failed"
            cat /tmp/civicaid_pytest_output.txt
            STATUS=1
        fi
        rm -f /tmp/civicaid_pytest_output.txt
    else
        echo "[WARNING] pytest not found. Activate venv or install pytest."
        STATUS=1
    fi

    echo ""
    echo "5. Required report checks"
    echo "-------------------------"

    REQUIRED_REPORTS=(
        "reports/daily_report.txt"
        "reports/civicaid_operations_summary.txt"
        "reports/security_audit_report.txt"
        "reports/health_check_report.txt"
    )

    for report in "${REQUIRED_REPORTS[@]}"; do
        if [ -f "$report" ]; then
            echo "[OK] Report exists: $report"
        else
            echo "[ERROR] Report missing: $report"
            STATUS=1
        fi
    done

    echo ""
    echo "6. Final result"
    echo "---------------"

    if [ "$STATUS" -eq 0 ]; then
        echo "[OK] All quality checks passed."
    else
        echo "[ERROR] Some quality checks failed."
    fi

} > "$REPORT_FILE"

cat "$REPORT_FILE"

exit "$STATUS"
