# Environment Setup Guide

Quick setup guide for local development.

## Setup Steps

1. Clone and install:
   ```bash
   git clone <repository-url>
   cd ubi-strapi-provider/strapi
   yarn install
   ```

2. Set up environment:
   ```bash
   cp .env.example .env
   ```

3. Configure `.env`:
   ```bash
   # Database
   DATABASE_CLIENT=postgres
   DATABASE_HOST=localhost
   DATABASE_PORT=5432
   DATABASE_NAME=uba_provider
   DATABASE_USERNAME=your_username
   DATABASE_PASSWORD=your_password

   # Application
   HOST=0.0.0.0
   PORT=1337
   NODE_ENV=development

   # Generate these using: openssl rand -base64 32
   APP_KEYS=key1,key2,key3,key4
   API_TOKEN_SALT=your-token-salt
   ADMIN_JWT_SECRET=your-admin-jwt
   JWT_SECRET=your-jwt-secret
   ```

## Database Setup

### Using Docker (Recommended)
```bash
docker-compose up postgres -d
```

### Local PostgreSQL
```sql
CREATE DATABASE uba_provider;
CREATE USER your_username WITH ENCRYPTED PASSWORD 'your_password';
GRANT ALL PRIVILEGES ON DATABASE uba_provider TO your_username;
```

## Verify Setup
```bash
# Test database
yarn strapi database:test-connection

# Start development server
yarn develop

# Access admin: http://localhost:1337/admin
```

## Troubleshooting

- Database issues: Check PostgreSQL is running and credentials are correct
- Node.js version: Use Node.js 18.x
- Port conflicts: Ensure ports 1337 and 5432 are free