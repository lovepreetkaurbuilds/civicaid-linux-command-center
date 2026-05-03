#!/bin/bash

HELP_FILE="data/help_requests.csv"

if [ ! -f "$HELP_FILE" ]; then
    echo "[ERROR] Help request file not found: $HELP_FILE"
    exit 1
fi

KEYWORD="$1"

if [ -z "$KEYWORD" ]; then
    read -p "Enter search keyword: " KEYWORD
fi

echo "Searching help requests for: $KEYWORD"
echo "-----------------------------------"

grep -i "$KEYWORD" "$HELP_FILE"

if [ $? -eq 0 ]; then
    echo "[OK] Search completed."
else
    echo "[INFO] No matching help requests found."
fi
