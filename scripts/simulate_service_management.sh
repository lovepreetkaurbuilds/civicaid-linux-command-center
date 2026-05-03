#!/bin/bash

set -euo pipefail

SERVICE_NAME="civicaid"
SIM_ROOT="$HOME/remote-server-sim"
SERVICE_DIR="$SIM_ROOT/etc/systemd/system"
SERVICE_FILE="$SERVICE_DIR/${SERVICE_NAME}.service"
APP_DIR="$SIM_ROOT/opt/civicaid"
LOG_FILE="logs/service_simulation.log"

mkdir -p "$SERVICE_DIR" logs

log() {
    echo "$(date '+%Y-%m-%d %H:%M:%S') [service_simulation] $1" | tee -a "$LOG_FILE"
}

ACTION="${1:-status}"

case "$ACTION" in
    install)
        cp config/civicaid.service.example "$SERVICE_FILE"
        log "[OK] Installed simulated service file: $SERVICE_FILE"
        ;;

    start)
        log "[SIMULATED] systemctl start $SERVICE_NAME"
        echo "running" > "$SIM_ROOT/var/run_${SERVICE_NAME}.state"
        ;;

    stop)
        log "[SIMULATED] systemctl stop $SERVICE_NAME"
        echo "stopped" > "$SIM_ROOT/var/run_${SERVICE_NAME}.state"
        ;;

    restart)
        log "[SIMULATED] systemctl restart $SERVICE_NAME"
        echo "running" > "$SIM_ROOT/var/run_${SERVICE_NAME}.state"
        ;;

    status)
        if [ -f "$SIM_ROOT/var/run_${SERVICE_NAME}.state" ]; then
            STATE=$(cat "$SIM_ROOT/var/run_${SERVICE_NAME}.state")
        else
            STATE="not-installed-or-unknown"
        fi

        echo "CivicAid simulated service status:"
        echo "Service: $SERVICE_NAME"
        echo "State: $STATE"
        echo "App directory: $APP_DIR"
        echo "Service file: $SERVICE_FILE"
        log "[OK] Checked simulated service status: $STATE"
        ;;

    *)
        echo "Usage: ./scripts/simulate_service_management.sh {install|start|stop|restart|status}"
        exit 1
        ;;
esac
