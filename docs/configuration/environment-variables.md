# Environment Variables

Copy `.env.example` to `.env` and configure the variables:
```bash
cp .env.example .env
```

## Server Variables

| Variable | Description | Example |
|----------|-------------|---------|
| HOST | Server host address | `0.0.0.0` |
| PORT | Server port number | `1337` |
| PUBLIC_URL | Production domain URL | `https://your-domain.com` |

## Database Variables

| Variable | Description | Example |
|----------|-------------|---------|
| DATABASE_CLIENT | Database type | `postgres` |
| DATABASE_HOST | Database host address | `localhost` |
| DATABASE_PORT | Database port | `5432` |
| DATABASE_NAME | Database name | `uba_provider` |
| DATABASE_USERNAME | Database user | `your_username` |
| DATABASE_PASSWORD | Database password | `your_password` |

## Security Variables

| Variable | Description | Example |
|----------|-------------|---------|
| JWT_SECRET | JWT signing key | `your-jwt-secret` |
| APP_KEYS | Application keys (comma-separated) | `key1,key2,key3,key4` |
| ADMIN_JWT_SECRET | Admin JWT signing key | `your-admin-jwt` |
| API_TOKEN_SALT | API token salt | `your-api-salt` |
| TRANSFER_TOKEN_SALT | Transfer token salt | `your-transfer-salt` |

## Other Variables

| Variable | Description | Example |
|----------|-------------|---------|
| NODE_ENV | Environment name | `development` or `production` |
| FORCE_SSL | Enable HTTPS redirect | `true` or `false` |
| PGADMIN_DEFAULT_EMAIL | pgAdmin login email | `admin@example.com` |
| PGADMIN_DEFAULT_PASSWORD | pgAdmin login password | `secure_password` |

## Important Notes
- Never commit `.env` to git
- Use strong passwords in production
- Enable HTTPS in production
- Use different values per environment