# Deployment Guide

Deploy UBI Strapi Provider to production.

## Steps

1. Configure environment:
```bash
cp .env.example .env

# Update in .env:
HOST=0.0.0.0
PORT=1337
PUBLIC_URL=https://your-domain.com
DATABASE_CLIENT=postgres
DATABASE_HOST=your-db-host
DATABASE_NAME=your-db-name
DATABASE_USERNAME=your-username
DATABASE_PASSWORD=your-password
NODE_ENV=production
```

2. Deploy with Docker:
```bash
docker-compose build --no-cache strapi
docker-compose up -d
```

3. Verify:
- Check: `docker-compose ps`
- Logs: `docker-compose logs -f strapi`
- Access: https://your-domain.com/admin

## SSL with Nginx

```nginx
server {
    listen 443 ssl;
    server_name your-domain.com;
    ssl_certificate /path/to/cert.pem;
    ssl_certificate_key /path/to/key.pem;

    location / {
        proxy_pass http://localhost:1337;
        proxy_http_version 1.1;
        proxy_set_header Host $host;
    }
}
```

## Maintenance

Update:
```bash
git pull
docker-compose build strapi
docker-compose up -d
```

Backup:
```bash
docker-compose exec postgres pg_dump -U $DATABASE_USERNAME $DATABASE_NAME > backup.sql
```