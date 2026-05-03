#!/bin/bash

REPORT_FILE="reports/daily_report.txt"
HELP_FILE="data/help_requests.csv"
TICKETS_FILE="data/service_tickets.csv"
VOLUNTEERS_FILE="data/volunteers.csv"
DONATIONS_FILE="data/donations.csv"

generate_header() {
    echo "CivicAid Daily Operations Report" > "$REPORT_FILE"
    echo "Generated on: $(date)" >> "$REPORT_FILE"
    echo "Project: CivicAid Linux Operations Command Center" >> "$REPORT_FILE"
    echo "" >> "$REPORT_FILE"
}

add_summary() {
    echo "1. Total help request records:" >> "$REPORT_FILE"
    tail -n +2 "$HELP_FILE" | wc -l >> "$REPORT_FILE"
    echo "" >> "$REPORT_FILE"

    echo "2. High urgency help requests:" >> "$REPORT_FILE"
    grep "high" "$HELP_FILE" >> "$REPORT_FILE"
    echo "" >> "$REPORT_FILE"

    echo "3. Pending service tickets:" >> "$REPORT_FILE"
    grep "pending" "$TICKETS_FILE" >> "$REPORT_FILE"
    echo "" >> "$REPORT_FILE"

    echo "4. Total volunteer records:" >> "$REPORT_FILE"
    tail -n +2 "$VOLUNTEERS_FILE" | wc -l >> "$REPORT_FILE"
    echo "" >> "$REPORT_FILE"

    echo "5. Donations above 5000:" >> "$REPORT_FILE"
    awk -F "," '$3 > 5000 {print $1, $2, $3, $5}' "$DONATIONS_FILE" >> "$REPORT_FILE"
}

generate_header
add_summary

echo "[OK] Report generated: $REPORT_FILE"
