# Build and Run Guide

## Local Development

1. Start development server:
   ```bash
   cd strapi
   yarn develop
   ```

2. Access:
   - Admin: http://localhost:1337/admin
   - API Docs: http://localhost:1337/documentation

## Docker Development

1. Start all services:
   ```bash
   docker-compose up -d
   ```

2. Common commands:
   ```bash
   # View logs
   docker-compose logs -f strapi

   # Stop services
   docker-compose down

   # Restart Strapi
   docker-compose restart strapi
   ```

## Production Notes

Basic checklist for DevOps:

1. Build:
   ```bash
   docker-compose -f docker-compose.prod.yml build
   ```

2. Configuration:
   - Set `NODE_ENV=production`
   - Use secure database credentials
   - Configure SSL/TLS
   - Set up health monitoring
   - Plan backup strategy

3. Security:
   - Update all secrets/keys
   - Enable SSL
   - Configure firewalls
   - Set up monitoring