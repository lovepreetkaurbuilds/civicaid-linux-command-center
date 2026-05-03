# CivicAid Manual Test Checklist

This checklist is used to validate the CivicAid Linux Operations Command Center manually.

## Basic project checks

- [ ] Project opens from Ubuntu WSL.
- [ ] `git status` works.
- [ ] Required folders exist: data, reports, logs, scripts, src, tests, config, docs.
- [ ] README.md exists.

## Script checks

- [ ] `bash -n scripts/*.sh` passes.
- [ ] Shell scripts are executable.
- [ ] `./scripts/generate_report.sh` runs.
- [ ] `./scripts/run_health_check.sh` runs.
- [ ] `./scripts/security_audit.sh` runs.
- [ ] `./scripts/monitor_logs.sh` runs.
- [ ] `./scripts/generate_summary_reports.sh` runs.
- [ ] `./scripts/civicaid_command_center.sh` opens the menu.

## Python checks

- [ ] Virtual environment can be activated.
- [ ] `pytest` runs.
- [ ] Python tests pass.
- [ ] `python3 src/civicaid.py` runs.

## Report checks

- [ ] daily_report.txt is generated.
- [ ] health_check_report.txt is generated.
- [ ] security_audit_report.txt is generated.
- [ ] civicaid_operations_summary.txt is generated.
- [ ] quality_check_report.txt is generated.

## Security checks

- [ ] config/app.env is ignored by Git.
- [ ] config/app.env.example contains only fake/sample values.
- [ ] .venv/ is ignored.
- [ ] *.pid files are ignored.
- [ ] No private SSH key is inside the project.

## GitHub checks

- [ ] Project is pushed to GitHub.
- [ ] README explains the project.
- [ ] docs/ contains stage documentation.
- [ ] scripts/ contains automation scripts.
- [ ] reports/ contains generated proof reports.
