# Stage 24: Service Management and Deployment Simulation

This stage explains how Linux services are managed and how CivicAid could run as a background server process.

## Concepts learned

- Linux services
- systemd
- systemctl
- service files
- start
- stop
- restart
- status
- enable concept
- journalctl concept

## Commands/concepts practiced

```bash
systemctl status cron
systemctl start service-name
systemctl stop service-name
systemctl restart service-name
journalctl -u service-name
