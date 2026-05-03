# CivicAid Access Control Policy

This document defines a sample role-based access model for the CivicAid Linux Operations Command Center.

## Purpose

CivicAid separates access by role so that each type of user only accesses the files needed for their work.

## Roles

### Admin

Admins manage the complete CivicAid system, including scripts, configuration, logs, backups, and deployment tasks.

### Volunteer

Volunteers work with help requests and assigned community tasks. They should not access finance records or system configuration.

### Finance

Finance users manage donation records and finance reports. They should not modify shell scripts or system deployment files.

### Support

Support users handle service tickets and review operational logs. They should not edit donation data.

### Viewer

Viewers can read generated reports but cannot edit operational data.

## Real-world Linux mapping

| Role | Linux group | Example folder access |
|---|---|---|
| Admin | civicaid-admin | full project access |
| Volunteer | civicaid-volunteer | data/help_requests.csv |
| Finance | civicaid-finance | data/donations.csv |
| Support | civicaid-support | data/service_tickets.csv and logs/ |
| Viewer | civicaid-viewer | reports/ |

## Security rule

Use the least privilege principle: give users only the access they need, not more.
