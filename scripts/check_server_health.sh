#!/bin/bash

set -euo pipefail

URL="${1:-http://localhost:8000/health}"

echo "Checking CivicAid server health..."
echo "URL: $URL"

if curl -fsS "$URL" >/tmp/civicaid_health_response.json; then
    echo "[OK] Server health check passed."
    cat /tmp/civicaid_health_response.json
    echo ""
    rm -f /tmp/civicaid_health_response.json
else
    echo "[ERROR] Server health check failed."
    echo "Make sure the CivicAid server is running:"
    echo "python3 src/civicaid_server.py"
    exit 1
fi
