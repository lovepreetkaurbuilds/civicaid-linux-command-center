#!/bin/bash

set -euo pipefail

REPORT_FILE="reports/weekly_summary.txt"
HELP_FILE="data/help_requests.csv"
VOLUNTEERS_FILE="data/volunteers.csv"
DONATIONS_FILE="data/donations.csv"
TICKETS_FILE="data/service_tickets.csv"
LOG_FILE="logs/script_activity.log"

mkdir -p reports logs

log() {
    echo "$(date '+%Y-%m-%d %H:%M:%S') [weekly_summary] $1" | tee -a "$LOG_FILE"
}

log "Starting weekly summary generation."

{
    echo "CivicAid Weekly Operations Summary"
    echo "Generated on: $(date)"
    echo "=================================="
    echo ""

    echo "1. Weekly record counts"
    echo "-----------------------"
    echo "Help requests: $(tail -n +2 "$HELP_FILE" | wc -l)"
    echo "Volunteers: $(tail -n +2 "$VOLUNTEERS_FILE" | wc -l)"
    echo "Donations: $(tail -n +2 "$DONATIONS_FILE" | wc -l)"
    echo "Service tickets: $(tail -n +2 "$TICKETS_FILE" | wc -l)"
    echo ""

    echo "2. High urgency pending help requests"
    echo "-------------------------------------"
    awk -F "," '$5 == "high" && $6 == "pending" {print $1, $2, $3, $4, $6}' "$HELP_FILE"
    echo ""

    echo "3. Pending service tickets"
    echo "--------------------------"
    awk -F "," '$5 == "pending" {print $1, $2, $3, $4, $5}' "$TICKETS_FILE"
    echo ""

    echo "4. Donation total"
    echo "-----------------"
    awk -F "," 'NR > 1 {total += $3} END {print "Total donations:", total}' "$DONATIONS_FILE"
} > "$REPORT_FILE"

log "[OK] Weekly summary generated: $REPORT_FILE"
echo "[OK] Weekly summary generated: $REPORT_FILE"
