# Environment Variables

All environment variables used in the project with their descriptions.

```bash
# The IP address the server will listen on. Use 0.0.0.0 to accept connections from any IP
HOST=0.0.0.0

# The port number the server will listen on. Default Strapi port is 1337
PORT=1337

# Current environment. Use 'development' for local development, 'production' for live servers
NODE_ENV=development

# The database system being used. Keep this as 'postgres' as the project is configured for PostgreSQL
DATABASE_CLIENT=postgres

# The hostname where your PostgreSQL database is running. Use 'localhost' for local development
DATABASE_HOST=localhost

# The port number where PostgreSQL is accepting connections. Default PostgreSQL port is 5432
DATABASE_PORT=5432

# The name of your PostgreSQL database
DATABASE_NAME=uba_provider

# The username to connect to your PostgreSQL database
DATABASE_USERNAME=strapi

# The password to connect to your PostgreSQL database. Use a strong password!
DATABASE_PASSWORD=

# Secret key used to sign JWT tokens for regular API authentication
# Generate using: openssl rand -base64 32
JWT_SECRET=

# Secret key used to sign JWT tokens specifically for admin panel authentication
# Generate using: openssl rand -base64 32
ADMIN_JWT_SECRET=

# Salt used when generating API tokens. Makes tokens more secure and unique
# Generate using: openssl rand -base64 32
API_TOKEN_SALT=

# Four random keys used by Strapi for various encryption/security needs
# Generate four different keys using: openssl rand -base64 32
# Then combine them with commas like: key1,key2,key3,key4
APP_KEYS=

# The full URL where your API will be accessible in production
# Example: https://api.example.com
PUBLIC_URL=

# When true, redirects all HTTP traffic to HTTPS. Enable this in production
FORCE_SSL=false

# Email address used to login to PgAdmin interface when using Docker
# Only needed if you're using PgAdmin through Docker
PGADMIN_DEFAULT_EMAIL=

# Password for PgAdmin interface when using Docker
# Only needed if you're using PgAdmin through Docker
PGADMIN_DEFAULT_PASSWORD=
```

## Quick Setup

1. Copy example file:
   ```bash
   cp .env.example .env
   ```

2. Generate secure keys:
   ```bash
   # Generate APP_KEYS
   openssl rand -base64 32
   # Repeat 4 times and combine with commas

   # Generate other secrets
   openssl rand -base64 32  # JWT_SECRET
   openssl rand -base64 32  # ADMIN_JWT_SECRET
   openssl rand -base64 32  # API_TOKEN_SALT
   ```

3. Update database credentials:
   ```bash
   DATABASE_USERNAME=your_username
   DATABASE_PASSWORD=your_secure_password
   ```

## Security Notes

- Never commit `.env` to git
- Use strong passwords in production
- Change all keys/secrets between environments
- Enable SSL in production