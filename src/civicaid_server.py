import csv
import json
from http.server import BaseHTTPRequestHandler, HTTPServer
from pathlib import Path


HOST = "127.0.0.1"
PORT = 8000
HELP_FILE = Path("data/help_requests.csv")


def load_help_requests():
    with HELP_FILE.open(newline="", encoding="utf-8") as csv_file:
        return list(csv.DictReader(csv_file))


def get_urgent_requests():
    requests = load_help_requests()
    return [
        request
        for request in requests
        if request.get("urgency") == "high" and request.get("status") == "pending"
    ]


class CivicAidHandler(BaseHTTPRequestHandler):
    def send_json(self, status_code, data):
        response = json.dumps(data, indent=2).encode("utf-8")
        self.send_response(status_code)
        self.send_header("Content-Type", "application/json")
        self.send_header("Content-Length", str(len(response)))
        self.end_headers()
        self.wfile.write(response)

    def do_GET(self):
        if self.path == "/health":
            self.send_json(
                200,
                {
                    "status": "ok",
                    "service": "CivicAid Linux Operations Command Center",
                },
            )
        elif self.path == "/urgent":
            self.send_json(
                200,
                {
                    "urgent_requests": get_urgent_requests(),
                },
            )
        else:
            self.send_json(
                404,
                {
                    "error": "Not found",
                    "available_routes": ["/health", "/urgent"],
                },
            )


def run_server():
    server = HTTPServer((HOST, PORT), CivicAidHandler)
    print(f"CivicAid server running at http://{HOST}:{PORT}")
    print("Available routes: /health, /urgent")
    print("Press Ctrl+C to stop.")
    server.serve_forever()


if __name__ == "__main__":
    run_server()
