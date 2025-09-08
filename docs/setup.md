# Setup Guide

Quick setup for local development.

## Installation

1. Install dependencies:
```bash
cd strapi
yarn install
```

2. Set up environment:
```bash
cp .env.example .env
# Edit .env and set:
# - DATABASE_PASSWORD
# - APP_KEYS
```

3. Start services:
```bash
# With Docker (recommended)
docker-compose up -d

# Without Docker
docker-compose up postgres -d  # Start only database
cd strapi
yarn develop
```

4. Access admin panel:
- Open http://localhost:1337/admin
- Create admin account

## Troubleshooting

- Database connection fails:
  - Check if PostgreSQL is running
  - Verify .env credentials
  - Check port 5432 is free

- Strapi won't start:
  - Use Node.js v18
  - Try: `rm -rf node_modules && yarn install`
  - Check logs: `docker-compose logs strapi`