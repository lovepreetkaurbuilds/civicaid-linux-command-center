#!/bin/bash

echo "CivicAid Health Check"
echo "===================="

REQUIRED_DIRS=("data" "reports" "logs" "scripts" "src" "tests" "backups" "config" "docs")
REQUIRED_FILES=("README.md" "requirements.txt" "data/help_requests.csv" "src/civicaid.py")
REQUIRED_TOOLS=("git" "python3" "pip3" "tree" "curl" "wget")

check_directories() {
    echo ""
    echo "Checking required directories..."
    for dir in "${REQUIRED_DIRS[@]}"; do
        if [ -d "$dir" ]; then
            echo "[OK] Directory exists: $dir"
        else
            echo "[MISSING] Directory missing: $dir"
        fi
    done
}

check_files() {
    echo ""
    echo "Checking required files..."
    for file in "${REQUIRED_FILES[@]}"; do
        if [ -f "$file" ]; then
            echo "[OK] File exists: $file"
        else
            echo "[MISSING] File missing: $file"
        fi
    done
}

check_tools() {
    echo ""
    echo "Checking required tools..."
    for tool in "${REQUIRED_TOOLS[@]}"; do
        if command -v "$tool" >/dev/null 2>&1; then
            echo "[OK] Tool found: $tool"
        else
            echo "[MISSING] Tool missing: $tool"
        fi
    done
}

check_directories
check_files
check_tools

echo ""
echo "[OK] Health check completed."
