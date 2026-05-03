# Stage 19: Cron and Scheduled Automation

This stage demonstrates scheduled automation using cron for the CivicAid Linux Operations Command Center.

## Concepts learned

- cron
- crontab
- scheduled jobs
- cron timing syntax
- cron logs
- wrapper scripts
- common cron mistakes

## Commands practiced

- command -v cron
- command -v crontab
- sudo service cron status
- sudo service cron start
- crontab -e
- crontab -l

## CivicAid scheduled jobs

| Job | Schedule | Script |
|---|---|---|
| Daily report generation | 0 9 * * * | scripts/run_daily_report_cron.sh |
| Daily compressed backup | 0 22 * * * | scripts/run_backup_cron.sh |

## Scripts created

| Script | Purpose |
|---|---|
| scripts/run_daily_report_cron.sh | Runs generate_report.sh from the correct project folder and logs output |
| scripts/run_backup_cron.sh | Runs backup_data.sh from the correct project folder and logs output |

## Important lessons

Cron does not automatically run from the project directory, so scripts should use absolute paths or cd into the project folder.

Cron jobs should write output to log files so failures can be debugged later.

In WSL, cron usually runs while Ubuntu WSL is active. If WSL is fully shut down, scheduled jobs may not run.

## Real-world meaning

Cron is used on Linux servers to automate repeated tasks such as reports, backups, health checks, cleanup jobs, and maintenance scripts.
