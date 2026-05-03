# Stage 20: Networking Basics

This stage demonstrates basic Linux networking using the CivicAid Linux Operations Command Center.

## Commands practiced

- ping
- curl
- wget
- ip addr
- ss

## Concepts learned

- localhost
- ports
- HTTP basics
- health check endpoint
- local server testing
- listening sockets

## CivicAid tasks completed

1. Created a local Python HTTP server.
2. Added a /health endpoint.
3. Added an /urgent endpoint.
4. Used curl to test server health.
5. Used wget to save server responses.
6. Used ss to confirm the server was listening on port 8000.
7. Saved server response outputs into reports.

## Local routes

| Route | Purpose |
|---|---|
| /health | Confirms the CivicAid server is running |
| /urgent | Returns urgent pending help requests |

## Real-world meaning

Networking basics help Linux users test APIs, confirm services are running, check ports, diagnose connection issues, and verify backend health checks from the terminal.
