#!/bin/bash

ENV_FILE="config/app.env"

if [ ! -f "$ENV_FILE" ]; then
    echo "[ERROR] $ENV_FILE not found."
    echo "Create it from config/app.env.example and use fake/local values only."
    exit 1
fi

set -a
source "$ENV_FILE"
set +a

echo "[OK] CivicAid environment loaded."
echo "Environment: $CIVICAID_ENV"
echo "App name: $CIVICAID_APP_NAME"
echo "Log level: $CIVICAID_LOG_LEVEL"
