# Database Configuration

This guide covers PostgreSQL configuration, schema management, and database operations for the UBI Strapi Provider.

## PostgreSQL Configuration

### Database Setup
The project uses PostgreSQL 14.17 with the following default configuration:

```env
DATABASE_NAME=uba_provider
DATABASE_USERNAME=strapi_db_user
DATABASE_PASSWORD=strapi_db_pass
DATABASE_HOST=127.0.0.1
DATABASE_PORT=5432
```

### Connection Configuration
Database connection is managed through Strapi's configuration in `./config/database.ts`:

```typescript
export default ({ env }) => ({
  connection: {
    client: 'postgres',
    connection: {
      host: env('DATABASE_HOST', '127.0.0.1'),
      port: env.int('DATABASE_PORT', 5432),
      database: env('DATABASE_NAME', 'uba_provider'),
      user: env('DATABASE_USERNAME', 'strapi_db_user'),
      password: env('DATABASE_PASSWORD', 'strapi_db_pass'),
      ssl: env.bool('DATABASE_SSL', false),
    },
  },
});
```

## Database Schema

### Core Tables
- `strapi_core_store_settings`: Strapi core settings
- `strapi_database_schema`: Schema version information
- `strapi_migrations`: Migration history
- `strapi_webhooks`: Webhook configurations

### Content Type Tables
- `benefits`: Benefit definitions and configurations
- `applications`: Benefit applications and status
- `providers`: Provider information and settings
- `users-permissions_user`: User management
- `users-permissions_role`: Role definitions

## Migration Management

### Running Migrations
```bash
# Development
npm run strapi database:migrate

# Production (in Docker)
docker-compose exec strapi npm run strapi database:migrate
```

### Creating Migrations
Strapi automatically generates migrations when you:
1. Update content types
2. Modify database schema
3. Add new collections

### Migration Status
Check migration status:
```bash
npm run strapi database:migration:status
```

## Backup and Restore

### Backup Database
```bash
# Local backup
pg_dump -U strapi_db_user -d uba_provider > backup.sql

# Docker backup
docker-compose exec postgres pg_dump -U strapi_db_user uba_provider > backup.sql
```

### Restore Database
```bash
# Local restore
psql -U strapi_db_user -d uba_provider < backup.sql

# Docker restore
cat backup.sql | docker-compose exec -T postgres psql -U strapi_db_user uba_provider
```

## Database Maintenance

### Health Checks
```bash
# Check database size
SELECT pg_size_pretty(pg_database_size('uba_provider'));

# Check table sizes
SELECT relname as table_name,
       pg_size_pretty(pg_total_relation_size(relid)) as total_size
FROM pg_catalog.pg_statio_user_tables
ORDER BY pg_total_relation_size(relid) DESC;
```

### Optimization
1. Regular VACUUM
```sql
VACUUM ANALYZE;
```

2. Index Maintenance
```sql
REINDEX DATABASE uba_provider;
```

## Troubleshooting

### Common Issues

1. Connection Errors
- Check database service status
- Verify credentials
- Confirm network connectivity
- Check SSL settings

2. Performance Issues
- Monitor query performance
- Check index usage
- Analyze slow queries
- Review connection pool settings

3. Space Issues
- Monitor database size
- Check table growth
- Review backup storage
- Clean old data

## Security

### Access Control
- Use strong passwords
- Limit database user permissions
- Enable SSL for remote connections
- Regular security audits

### Encryption
- Enable SSL connections
- Encrypt sensitive data
- Use secure connection strings
- Implement data masking

## Monitoring

### Key Metrics
- Connection count
- Query performance
- Database size
- Cache hit ratio
- Transaction rate

### Logging
- Enable slow query logging
- Monitor error logs
- Track connection attempts
- Audit schema changes

## Development Guidelines

### Best Practices
1. Use migrations for schema changes
2. Maintain indexes
3. Regular backups
4. Performance monitoring
5. Security updates

### Query Optimization
1. Use proper indexes
2. Optimize joins
3. Implement caching
4. Regular maintenance
