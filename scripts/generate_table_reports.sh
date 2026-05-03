#!/bin/bash

set -euo pipefail

REPORT_FILE="reports/help_requests_table.txt"
HELP_FILE="data/help_requests.csv"

mkdir -p reports

{
    echo "CivicAid Help Requests Table"
    echo "Generated on: $(date)"
    echo ""

    column -s, -t "$HELP_FILE"

} > "$REPORT_FILE"

echo "[OK] Table report generated: $REPORT_FILE"
