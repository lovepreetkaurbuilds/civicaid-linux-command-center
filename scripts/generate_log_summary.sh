#!/bin/bash

set -euo pipefail

LOG_DIR="logs"
REPORT_FILE="reports/log_summary_report.txt"

mkdir -p reports

{
    echo "CivicAid Log Summary Report"
    echo "Generated on: $(date)"
    echo "==========================="
    echo ""

    echo "1. Log files:"
    ls -lh "$LOG_DIR"
    echo ""

    echo "2. ERROR count:"
    grep -R "ERROR" "$LOG_DIR" 2>/dev/null | wc -l
    echo ""

    echo "3. WARNING count:"
    grep -R "WARNING" "$LOG_DIR" 2>/dev/null | wc -l
    echo ""

    echo "4. OK messages count:"
    grep -R "\[OK\]" "$LOG_DIR" 2>/dev/null | wc -l
    echo ""

    echo "5. Latest ERROR entries:"
    grep -R "ERROR" "$LOG_DIR" 2>/dev/null | tail -n 10 || echo "No errors found."
    echo ""

    echo "6. Latest WARNING entries:"
    grep -R "WARNING" "$LOG_DIR" 2>/dev/null | tail -n 10 || echo "No warnings found."

} > "$REPORT_FILE"

echo "[OK] Log summary generated: $REPORT_FILE"
