#!/bin/bash

set -euo pipefail

REPORT_DIR="reports"
DATA_DIR="data"
LOG_DIR="logs"
SUMMARY_FILE="$REPORT_DIR/civicaid_operations_summary.txt"

mkdir -p "$REPORT_DIR"

HELP_FILE="$DATA_DIR/help_requests.csv"
VOLUNTEERS_FILE="$DATA_DIR/volunteers.csv"
DONATIONS_FILE="$DATA_DIR/donations.csv"
TICKETS_FILE="$DATA_DIR/service_tickets.csv"

{
    echo "CivicAid Operations Summary Report"
    echo "Generated on: $(date)"
    echo "=================================="
    echo ""

    echo "1. Total Records"
    echo "----------------"
    echo "Help requests: $(tail -n +2 "$HELP_FILE" | wc -l)"
    echo "Volunteers: $(tail -n +2 "$VOLUNTEERS_FILE" | wc -l)"
    echo "Donations: $(tail -n +2 "$DONATIONS_FILE" | wc -l)"
    echo "Service tickets: $(tail -n +2 "$TICKETS_FILE" | wc -l)"
    echo ""

    echo "2. Help Requests by Category"
    echo "----------------------------"
    tail -n +2 "$HELP_FILE" | cut -d "," -f 4 | sort | uniq -c | sort -nr
    echo ""

    echo "3. Help Requests by Status"
    echo "--------------------------"
    tail -n +2 "$HELP_FILE" | cut -d "," -f 6 | sort | uniq -c | sort -nr
    echo ""

    echo "4. High Urgency Pending Requests"
    echo "--------------------------------"
    awk -F "," '$5 == "high" && $6 == "pending" {print $1, $2, $3, $4, $6}' "$HELP_FILE"
    echo ""

    echo "5. Donation Total"
    echo "-----------------"
    awk -F "," 'NR > 1 {total += $3} END {print "Total donations:", total}' "$DONATIONS_FILE"
    echo ""

    echo "6. Donations by Method"
    echo "----------------------"
    tail -n +2 "$DONATIONS_FILE" | cut -d "," -f 5 | sort | uniq -c | sort -nr
    echo ""

    echo "7. Pending Service Tickets"
    echo "--------------------------"
    awk -F "," '$5 == "pending" {print $1, $2, $3, $4, $5}' "$TICKETS_FILE"
    echo ""

    echo "8. Recent Script Activity"
    echo "-------------------------"
    if [ -f "$LOG_DIR/script_activity.log" ]; then
        tail -n 10 "$LOG_DIR/script_activity.log"
    else
        echo "No script activity log found."
    fi
    echo ""

    echo "9. Error Summary"
    echo "----------------"
    if grep -R "ERROR" "$LOG_DIR" >/dev/null 2>&1; then
        grep -R "ERROR" "$LOG_DIR"
    else
        echo "No ERROR entries found."
    fi

} > "$SUMMARY_FILE"

echo "[OK] Summary report generated: $SUMMARY_FILE"
