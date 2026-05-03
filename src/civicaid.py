import csv
from pathlib import Path


DATA_FILE = Path("data/help_requests.csv")


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
    requests = load_help_requests()
    urgent_requests = get_urgent_requests(requests)

    print("CivicAid Urgent Pending Help Requests")
    print("=====================================")

    if not urgent_requests:
        print("No urgent pending requests found.")
        return

    for request in urgent_requests:
        print(format_request(request))


if __name__ == "__main__":
    main()
