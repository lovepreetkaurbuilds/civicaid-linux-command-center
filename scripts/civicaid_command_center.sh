#!/bin/bash

set -euo pipefail

PROJECT_DIR="$HOME/projects/civicaid-linux-command-center"
LOG_FILE="$PROJECT_DIR/logs/command_center.log"

mkdir -p "$PROJECT_DIR/logs"

log_action() {
    echo "$(date '+%Y-%m-%d %H:%M:%S') [command_center] $1" >> "$LOG_FILE"
}

pause_screen() {
    echo ""
    read -p "Press Enter to return to the menu..."
}

show_menu() {
    clear
    echo "=========================================="
    echo " CivicAid Linux Operations Command Center "
    echo "=========================================="
    echo ""
    echo "1. Generate daily operations report"
    echo "2. Run health check"
    echo "3. Search urgent help requests"
    echo "4. Search pending help requests"
    echo "5. Create compressed backup"
    echo "6. Monitor logs"
    echo "7. Generate advanced summary reports"
    echo "8. Generate table reports"
    echo "9. Generate log summary"
    echo "10. Check local server health"
    echo "11. Simulate remote deployment"
    echo "12. Simulate service status"
    echo "13. Run security audit"
    echo "14. Generate weekly summary"
    echo "15. Show Git status"
    echo "0. Exit"
    echo ""
}

run_command() {
    local description="$1"
    local command="$2"

    echo ""
    echo "Running: $description"
    echo "------------------------------------------"
    log_action "Started: $description"

    if eval "$command"; then
        echo ""
        echo "[OK] Completed: $description"
        log_action "Completed: $description"
    else
        echo ""
        echo "[ERROR] Failed: $description"
        log_action "Failed: $description"
    fi

    pause_screen
}

cd "$PROJECT_DIR"

while true; do
    show_menu
    read -p "Choose an option: " choice

    case "$choice" in
        1)
            run_command "Generate daily operations report" "./scripts/generate_report.sh"
            ;;

        2)
            run_command "Run health check" "./scripts/run_health_check.sh"
            ;;

        3)
            run_command "Search urgent help requests" "./scripts/search_requests.sh urgent"
            ;;

        4)
            run_command "Search pending help requests" "./scripts/search_requests.sh pending"
            ;;

        5)
            run_command "Create compressed backup" "./scripts/backup_data.sh"
            ;;

        6)
            run_command "Monitor logs" "./scripts/monitor_logs.sh"
            ;;

        7)
            run_command "Generate advanced summary reports" "./scripts/generate_summary_reports.sh"
            ;;

        8)
            run_command "Generate table reports" "./scripts/generate_table_reports.sh"
            ;;

        9)
            run_command "Generate log summary" "./scripts/generate_log_summary.sh"
            ;;

        10)
            run_command "Check local server health" "./scripts/check_server_health.sh"
            ;;

        11)
            run_command "Simulate remote deployment" "./scripts/simulate_remote_deploy.sh"
            ;;

        12)
            run_command "Simulate service status" "./scripts/simulate_service_management.sh status"
            ;;

        13)
            run_command "Run security audit" "./scripts/security_audit.sh"
            ;;

        14)
            run_command "Generate weekly summary" "./scripts/generate_weekly_summary.sh"
            ;;

        15)
            run_command "Show Git status" "git status"
            ;;

        0)
            echo "Exiting CivicAid Command Center."
            log_action "Exited command center."
            exit 0
            ;;

        *)
            echo "[ERROR] Invalid option. Choose 0-15."
            pause_screen
            ;;
    esac
done
