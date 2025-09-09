# Build and Run Guide

## A. Running Locally without Docker

1. Clone and Setup:
   ```bash
   git clone https://github.com/PSMRI/ubi-strapi-provider.git
   cd ubi-strapi-provider/strapi
   nvm use 18  # Ensure correct Node version
   npm install  # Using npm as specified in project setup
   ```

2. Configure Environment:
   ```bash
   cp .env.example .env
   ```
   
   Update .env with required configuration:
   ```bash
   # Strapi DB
   DATABASE_CLIENT=postgres
   DATABASE_HOST=127.0.0.1
   DATABASE_PORT=5432
   DATABASE_NAME=uba_provider
   DATABASE_USERNAME=strapi_db_user
   DATABASE_PASSWORD=strapi_db_pass

   # Strapi Secrets (Generate using: openssl rand -base64 32)
   JWT_SECRET=
   APP_KEYS=
   API_TOKEN_SALT=
   ADMIN_JWT_SECRET=
   TRANSFER_TOKEN_SALT=
   ```

3. Start PostgreSQL Database:
   ```bash
   docker-compose up postgres -d
   ```

4. Start Development Server:
   ```bash
   cd strapi
   npm run develop  # Using npm as specified in project setup
   ```

## B. Running with Docker

1. Configure Environment:
   ```bash
   cp .env.example .env
   ```
   
   Additional Docker-specific variables:
   ```bash
   # PGAdmin (if needed)
   PGADMIN_DEFAULT_EMAIL=
   PGADMIN_DEFAULT_PASSWORD=

   # Set to production for Docker deployment
   NODE_ENV=production
   ```

2. Start Database Services:
   ```bash
   # Start PostgreSQL and PgAdmin
   docker-compose up postgres pgadmin -d
   ```

3. Build and Start Strapi:
   ```bash
   # Build fresh image
   docker-compose build --no-cache strapi

   # Start Strapi service
   docker-compose up strapi -d
   ```

4. Monitor and Manage:
   ```bash
   # View logs
   docker-compose logs -f strapi

   # Stop all services
   docker-compose down
   ```

## Access Points

- Admin Panel: http://localhost:1337/admin
- API Documentation: http://localhost:1337/documentation
- API Endpoints: http://localhost:1337/api/<collection>
  - Use `?populate=*` to get all component details

## Project Structure

Key files for deployment:
- `Dockerfile` - Strapi container configuration
- `docker-compose.yml` - Service orchestration
- `deploy.sh` - Deployment script

## Reference Documentation

- [Strapi Quick Start Guide](https://docs.strapi.io/cms/quick-start)
- [Strapi Docker Guide](https://docs.strapi.io/cms/installation/docker)
- [Project Repository](https://github.com/PSMRI/ubi-strapi-provider)

## Important Notes

1. The project uses npm for package management.
2. TypeScript is enabled by default
3. PostgreSQL SSL is disabled by default
4. Custom collections can be created via Strapi admin UI
5. Node.js version 18.x is required