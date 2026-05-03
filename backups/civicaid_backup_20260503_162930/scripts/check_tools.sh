#!/bin/bash

echo "CivicAid Tool Check"
echo "==================="

tools=("git" "python3" "pip3" "tree" "htop" "curl" "wget")

for tool in "${tools[@]}"; do
    if command -v "$tool" >/dev/null 2>&1; then
        echo "[OK] $tool found at $(command -v "$tool")"
    else
        echo "[MISSING] $tool is not installed"
    fi
done
