# Prerequisites

Required software and resources for local development.

## Software Requirements

| Software | Version |
|----------|---------|
| Node.js | 18.x |
| Yarn | Latest |
| Git | Latest |
| Docker & Docker Compose | Latest (Optional) |
| PostgreSQL | 14.17 (via Docker) |

## System Requirements

| Resource | Minimum |
|----------|---------|
| RAM | 4GB |
| Disk Space | 10GB |
| Ports | 1337, 5432 |

## Quick Verify

```bash
# Versions
node --version  # Should be v18.x
yarn --version
docker --version

# Ports
nc -z localhost 1337 || echo "Port 1337 available"
nc -z localhost 5432 || echo "Port 5432 available"
```

Next: Follow [Environment Setup](./env-setup.md)