# How to Run CivicAid

## Go to project

```bash
cd ~/projects/civicaid-linux-command-center
Run command center
./scripts/civicaid_command_center.sh
Generate daily report
./scripts/generate_report.sh
cat reports/daily_report.txt
Generate weekly summary
./scripts/generate_weekly_summary.sh
cat reports/weekly_summary.txt
Run health check
./scripts/run_health_check.sh
Search help requests
./scripts/search_requests.sh urgent
./scripts/search_requests.sh pending
./scripts/search_requests.sh category medical
Create backup
./scripts/backup_data.sh
Monitor logs
./scripts/monitor_logs.sh
cat reports/log_monitor_report.txt
Run Python app
python3 src/civicaid.py
Run tests
source .venv/bin/activate
pytest
Run local server

Terminal 1:

python3 src/civicaid_server.py

Terminal 2:

curl http://localhost:8000/health
curl http://localhost:8000/urgent
Simulate deployment
./scripts/simulate_remote_deploy.sh
Run security audit
./scripts/security_audit.sh
Run error diagnoser
./scripts/error_diagnoser.sh

