# Stage 26: Common Linux Errors and Fixes

This stage documents and practices common Linux errors and their fixes using the CivicAid Linux Operations Command Center.

## Errors covered

- command not found
- permission denied
- no such file or directory
- wrong folder
- Python not found
- pip not found
- venv activation problem
- Git authentication problem
- PATH issue
- script not executable
- cron not running

## Commands practiced

- pwd
- ls
- ls -l
- chmod +x
- command -v
- python3 --version
- pip3 --version
- source .venv/bin/activate
- gh auth login
- sudo service cron status
- sudo service cron start
- crontab -l

## Script created

| Script | Purpose |
|---|---|
| scripts/error_diagnoser.sh | Checks common project setup, command, file, permission, Git, and cron issues |

## Report created

| Report | Purpose |
|---|---|
| reports/error_diagnosis_report.txt | Records common error diagnosis results |

## Real-world meaning

Linux work includes troubleshooting. Knowing how to read errors, check paths, inspect permissions, verify tools, and check logs is essential for real company workflows.
