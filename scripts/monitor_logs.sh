#!/bin/bash

set -euo pipefail

LOG_DIR="logs"
REPORT_FILE="reports/log_monitor_report.txt"

mkdir -p "$LOG_DIR" reports

echo "CivicAid Log Monitor"
echo "===================="
echo "Scanning logs in: $LOG_DIR"
echo ""

{
    echo "CivicAid Log Monitor Report"
    echo "Generated on: $(date)"
    echo ""
    echo "Log directory: $LOG_DIR"
    echo ""

    echo "1. Available log files:"
    ls -lh "$LOG_DIR"
    echo ""

    echo "2. ERROR entries:"
    if grep -R "ERROR" "$LOG_DIR"; then
        true
    else
        echo "No ERROR entries found."
    fi
    echo ""

    echo "3. WARNING entries:"
    if grep -R "WARNING" "$LOG_DIR"; then
        true
    else
        echo "No WARNING entries found."
    fi
    echo ""

    echo "4. Latest app log lines:"
    if [ -f "$LOG_DIR/app.log" ]; then
        tail -n 10 "$LOG_DIR/app.log"
    else
        echo "app.log not found."
    fi
    echo ""

    echo "5. Latest script activity lines:"
    if [ -f "$LOG_DIR/script_activity.log" ]; then
        tail -n 10 "$LOG_DIR/script_activity.log"
    else
        echo "script_activity.log not found."
    fi
} > "$REPORT_FILE"

echo "[OK] Log monitoring completed."
echo "Report saved to: $REPORT_FILE"
