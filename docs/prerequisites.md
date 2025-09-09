# Prerequisites

Before you begin, ensure you have the following requirements in place:

## Software Requirements

- **Node.js**: Version 18.x (use `nvm use 18` if using nvm)
- **npm**: Version >=6.0.0
- **Git**: Latest version
- **Docker & Docker Compose**: Latest version (optional, for containerized deployment)
- **PostgreSQL**: Version 14.17 (or use Docker)

## Database Requirements

PostgreSQL configuration needed:
- Support for database creation
- User with sufficient privileges
- No SSL connection required by default

## System Requirements

**Available Ports**: 
- 1337 (Strapi Admin/API)
- 5432 (PostgreSQL)
- Additional ports may be required for PgAdmin if used

## Network Requirements

Ensure access to:
- Package registries (npm)
- Git repositories

## Quick Verify

```bash
# Verify software versions
node --version
npm --version
git --version
docker --version  # If using Docker
```