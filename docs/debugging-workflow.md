# CivicAid Debugging Workflow

This document explains the debugging workflow used in the CivicAid Linux Operations Command Center.

## Basic debugging steps

1. Identify the failed command or script.
2. Read the terminal error message.
3. Check the latest logs using tail.
4. Search logs for ERROR or WARNING.
5. Check whether required files and folders exist.
6. Check permissions if the issue is related to access.
7. Fix the issue.
8. Run the command again.
9. Confirm success in the logs.
10. Commit the fix if project files changed.

## Useful commands

```bash
tail -n 20 logs/script_activity.log
tail -f logs/script_activity.log
grep -R "ERROR" logs/
grep -R "WARNING" logs/
ls -l scripts/
./scripts/run_health_check.sh
./scripts/monitor_logs.sh
