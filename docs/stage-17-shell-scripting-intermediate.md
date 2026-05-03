# Stage 17: Shell Scripting Intermediate

This stage improves the CivicAid shell scripts with safer and more professional scripting patterns.

## Concepts learned

- command substitution
- arrays
- case statements
- set -e
- set -u
- logging
- date command
- error handling
- safer script structure

## Scripts improved

| Script | Improvements |
|---|---|
| scripts/generate_report.sh | Added set -euo pipefail, functions, logging, file checks |
| scripts/backup_data.sh | Added timestamped backups, arrays, manifest file, logging |
| scripts/search_requests.sh | Added case statement, search modes, argument handling, logging |
| scripts/run_health_check.sh | Added arrays, functions, status tracking, exit codes, logging |

## Practical tasks completed

1. Improved report generation with safer file checks.
2. Improved backup creation with timestamped backup folders.
3. Added backup manifest files.
4. Created search modes for urgent, pending, category, and keyword.
5. Improved health checks with arrays and exit codes.
6. Added centralized script activity logging.

## Real-world meaning

Intermediate shell scripting makes Linux automation safer, more reusable, easier to debug, and closer to company server workflows.
