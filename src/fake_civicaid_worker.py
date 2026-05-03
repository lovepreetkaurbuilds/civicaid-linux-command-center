import time
from datetime import datetime
from pathlib import Path

log_file = Path("logs/app.log")
log_file.parent.mkdir(exist_ok=True)

print("CivicAid fake worker started. Press Ctrl+C to stop.")

while True:
    timestamp = datetime.now().strftime("%Y-%m-%d %H:%M:%S")
    message = f"{timestamp} - CivicAid worker heartbeat: system running\n"
    with log_file.open("a") as f:
        f.write(message)
    print(message.strip())
    time.sleep(5)
