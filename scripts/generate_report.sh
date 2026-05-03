#!/bin/bash

set -euo pipefail

REPORT_FILE="reports/daily_report.txt"
LOG_FILE="logs/script_activity.log"
HELP_FILE="data/help_requests.csv"
TICKETS_FILE="data/service_tickets.csv"
VOLUNTEERS_FILE="data/volunteers.csv"
DONATIONS_FILE="data/donations.csv"

log() {
    echo "$(date '+%Y-%m-%d %H:%M:%S') [generate_report] $1" | tee -a "$LOG_FILE"
}

require_file() {
    if [ ! -f "$1" ]; then
        log "[ERROR] Required file missing: $1"
        exit 1
    fi
}

count_records() {
    tail -n +2 "$1" | wc -l
}

write_section() {
    echo "" >> "$REPORT_FILE"
    echo "$1" >> "$REPORT_FILE"
}

mkdir -p reports logs

require_file "$HELP_FILE"
require_file "$TICKETS_FILE"
require_file "$VOLUNTEERS_FILE"
require_file "$DONATIONS_FILE"

log "Starting daily report generation."

echo "CivicAid Daily Operations Report" > "$REPORT_FILE"
echo "Generated on: $(date)" >> "$REPORT_FILE"
echo "Project: CivicAid Linux Operations Command Center" >> "$REPORT_FILE"

write_section "1. Total help request records:"
count_records "$HELP_FILE" >> "$REPORT_FILE"

write_section "2. High urgency help requests:"
if grep "high" "$HELP_FILE" >> "$REPORT_FILE"; then
    log "High urgency requests added to report."
else
    echo "No high urgency requests found." >> "$REPORT_FILE"
    log "No high urgency requests found."
fi

write_section "3. Pending service tickets:"
if grep "pending" "$TICKETS_FILE" >> "$REPORT_FILE"; then
    log "Pending service tickets added to report."
else
    echo "No pending service tickets found." >> "$REPORT_FILE"
    log "No pending service tickets found."
fi

write_section "4. Total volunteer records:"
count_records "$VOLUNTEERS_FILE" >> "$REPORT_FILE"

write_section "5. Donations above 5000:"
awk -F "," '$3 > 5000 {print $1, $2, $3, $5}' "$DONATIONS_FILE" >> "$REPORT_FILE"

log "[OK] Report generated: $REPORT_FILE"
