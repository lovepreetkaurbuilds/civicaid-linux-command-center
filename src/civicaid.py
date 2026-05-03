import csv
import os
from pathlib import Path


DATA_FILE = Path("data/help_requests.csv")


def get_app_config():
    """Read CivicAid settings from environment variables."""
    return {
        "environment": os.getenv("CIVICAID_ENV", "development"),
        "app_name": os.getenv("CIVICAID_APP_NAME", "CivicAid"),
        "log_level": os.getenv("CIVICAID_LOG_LEVEL", "info"),
        "backup_dir": os.getenv("CIVICAID_BACKUP_DIR", "backups"),
    }


def load_help_requests(file_path=DATA_FILE):
    """Load help requests from a CSV file."""
    with open(file_path, newline="", encoding="utf-8") as csv_file:
        return list(csv.DictReader(csv_file))


def get_urgent_requests(requests):
    """Return requests where urgency is high and status is pending."""
    return [
        request
        for request in requests
        if request.get("urgency") == "high" and request.get("status") == "pending"
    ]


def format_request(request):
    """Format one request for terminal output."""
    return (
        f"{request['request_id']} | {request['name']} | "
        f"{request['area']} | {request['category']} | {request['status']}"
    )


def main():
    config = get_app_config()
    requests = load_help_requests()
    urgent_requests = get_urgent_requests(requests)

    print(config["app_name"])
    print(f"Environment: {config['environment']}")
    print(f"Log level: {config['log_level']}")
    print()
    print("Urgent Pending Help Requests")
    print("============================")

    if not urgent_requests:
        print("No urgent pending requests found.")
        return

    for request in urgent_requests:
        print(format_request(request))


if __name__ == "__main__":
    main()
