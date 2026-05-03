# CivicAid Linux Operations Command Center

A practical Linux and Shell portfolio project that simulates a command-line operations system for a fictional NGO/community organization called **CivicAid**.

This project demonstrates Linux, Bash scripting, automation, logging, backups, networking, security, Python workflow, Git/GitHub workflow, and server-style operations.

All data is fake/sample data only.

---

## Project Concept

CivicAid helps manage:

- public help requests
- volunteer data
- donation records
- service tickets
- daily and weekly reports
- logs
- backups
- automation scripts
- server-style workflows

---

## Key Features

- Menu-driven Linux command center
- Daily and weekly report generation
- Help request search
- Health check script
- Security audit script
- Error diagnosis script
- Log monitoring
- Compressed backup workflow
- Cron scheduled automation
- Local Python HTTP server
- Remote deployment simulation
- Bash shortcuts and customization
- Python tests using pytest

---

## Skills Demonstrated

This project demonstrates:

- Linux navigation and filesystem usage
- file and folder management
- grep, awk, sed, cut, sort, uniq, wc
- pipes and redirection
- permissions and ownership
- users/groups access thinking
- process monitoring
- package management
- Python virtual environment and testing
- Git/GitHub from terminal
- environment variables and secret safety
- Bash scripting
- cron automation
- tar/gzip/zip backups
- curl/wget networking basics
- SSH/rsync server workflow concepts
- log monitoring and debugging
- security checks
- troubleshooting common Linux errors

See:

```text
docs/linux-shell-skills-proven.md
Main Scripts
Script	Purpose
scripts/civicaid_command_center.sh	Main menu-driven command center
scripts/generate_report.sh	Generates daily operations report
scripts/generate_weekly_summary.sh	Generates weekly summary report
scripts/backup_data.sh	Creates compressed backup
scripts/search_requests.sh	Searches help requests
scripts/run_health_check.sh	Runs health checks
scripts/monitor_logs.sh	Monitors logs and creates log report
scripts/security_audit.sh	Runs security audit
scripts/error_diagnoser.sh	Diagnoses common Linux errors
scripts/simulate_remote_deploy.sh	Simulates remote server deployment
scripts/check_server_health.sh	Checks local server health endpoint
How to Run

Go to project folder:

cd ~/projects/civicaid-linux-command-center

Run the command center:

./scripts/civicaid_command_center.sh

Run daily report:

./scripts/generate_report.sh

Run health check:

./scripts/run_health_check.sh

Run tests:

source .venv/bin/activate
pytest

Run local server:

python3 src/civicaid_server.py

Test server:

curl http://localhost:8000/health

More details:

docs/how-to-run-civicaid.md
Important Folders
Folder	Purpose
data/	Fake/sample CSV data
reports/	Generated reports
logs/	App, script, cron, and debug logs
scripts/	Bash automation scripts
src/	Python app/server files
tests/	Pytest tests
config/	Safe example config files
docs/	Project documentation
backups/	Backup placeholder; generated backups ignored
Security Notes

This project uses fake/sample data only.

Do not commit:

real .env files
passwords
real API keys
tokens
private SSH keys
personal/private data

Only safe example config files are committed.

Portfolio Meaning

This project is not a random command-practice repo.

It shows how Linux and Shell skills are used in realistic operations workflows: data processing, automation, reporting, logging, backups, debugging, deployment simulation, networking checks, security checks, and GitHub-based version control.
