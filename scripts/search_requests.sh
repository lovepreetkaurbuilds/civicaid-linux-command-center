#!/bin/bash

set -euo pipefail

HELP_FILE="data/help_requests.csv"
LOG_FILE="logs/script_activity.log"

log() {
    echo "$(date '+%Y-%m-%d %H:%M:%S') [search_requests] $1" >> "$LOG_FILE"
}

show_usage() {
    echo "Usage:"
    echo "  ./scripts/search_requests.sh urgent"
    echo "  ./scripts/search_requests.sh pending"
    echo "  ./scripts/search_requests.sh category medical"
    echo "  ./scripts/search_requests.sh keyword Gurdaspur"
}

mkdir -p logs

if [ ! -f "$HELP_FILE" ]; then
    echo "[ERROR] Help request file not found: $HELP_FILE"
    log "[ERROR] Help request file not found."
    exit 1
fi

MODE="${1:-}"

if [ -z "$MODE" ]; then
    show_usage
    read -p "Choose mode: " MODE
fi

case "$MODE" in
    urgent)
        echo "High urgency help requests:"
        log "Searching urgent help requests."
        grep "high" "$HELP_FILE" || echo "No urgent requests found."
        ;;

    pending)
        echo "Pending help requests:"
        log "Searching pending help requests."
        grep "pending" "$HELP_FILE" || echo "No pending requests found."
        ;;

    category)
        CATEGORY="${2:-}"
        if [ -z "$CATEGORY" ]; then
            read -p "Enter category: " CATEGORY
        fi
        echo "Help requests in category: $CATEGORY"
        log "Searching category: $CATEGORY"
        awk -F "," -v category="$CATEGORY" '$4 == category {print}' "$HELP_FILE" || true
        ;;

    keyword)
        KEYWORD="${2:-}"
        if [ -z "$KEYWORD" ]; then
            read -p "Enter keyword: " KEYWORD
        fi
        echo "Help requests matching keyword: $KEYWORD"
        log "Searching keyword: $KEYWORD"
        grep -i "$KEYWORD" "$HELP_FILE" || echo "No matches found."
        ;;

    *)
        echo "[ERROR] Unknown mode: $MODE"
        show_usage
        log "[ERROR] Unknown search mode: $MODE"
        exit 1
        ;;
esac

log "[OK] Search completed."
