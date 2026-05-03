from pathlib import Path
import sys

PROJECT_ROOT = Path(__file__).resolve().parents[1]
sys.path.insert(0, str(PROJECT_ROOT / "src"))

from civicaid import get_urgent_requests, format_request


def test_get_urgent_requests_returns_only_high_pending():
    requests = [
        {
            "request_id": "HR001",
            "name": "Aman Village Center",
            "area": "Gurdaspur",
            "category": "medical",
            "urgency": "high",
            "status": "pending",
        },
        {
            "request_id": "HR002",
            "name": "Ravi Community Block",
            "area": "Batala",
            "category": "food",
            "urgency": "medium",
            "status": "pending",
        },
        {
            "request_id": "HR003",
            "name": "Simran Help Desk",
            "area": "Amritsar",
            "category": "education",
            "urgency": "high",
            "status": "resolved",
        },
    ]

    urgent = get_urgent_requests(requests)

    assert len(urgent) == 1
    assert urgent[0]["request_id"] == "HR001"


def test_format_request_returns_readable_line():
    request = {
        "request_id": "HR004",
        "name": "Kiran Rural Point",
        "area": "Dera Baba Nanak",
        "category": "medical",
        "status": "pending",
    }

    result = format_request(request)

    assert result == "HR004 | Kiran Rural Point | Dera Baba Nanak | medical | pending"
