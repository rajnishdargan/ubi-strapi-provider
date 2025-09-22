# UBI Strapi Provider

Backend CMS for UBI Provider Platform.

## Developer Guide

### Official Documentation
Visit below links hosted with Gitbook for comprehensive documentation:

- [Strapi Provider Overview](https://piramal-swasthya.gitbook.io/uba/toasters/provider-toaster/developer-guide/backend-guide/strapi-provider)
- [Prerequisites](https://piramal-swasthya.gitbook.io/uba/toasters/provider-toaster/developer-guide/backend-guide/strapi-provider/prerequisites)
- [Environment Variables](https://piramal-swasthya.gitbook.io/uba/toasters/provider-toaster/developer-guide/backend-guide/strapi-provider/environment-variables)
- [Build and Run Guide](https://piramal-swasthya.gitbook.io/uba/toasters/provider-toaster/developer-guide/backend-guide/strapi-provider/build-and-run-guide)
- [Sample Data](https://piramal-swasthya.gitbook.io/uba/toasters/provider-toaster/developer-guide/backend-guide/strapi-provider/sample-data)

### How base Strapi Project was setup in this repo?

#### 1. Node Version Setup
```bash
nvm use 18
```

#### 2. Create Strapi Project
```bash
npx create-strapi@5.12.6 strapi
```

#### 3. Project Initialization Options
```
? Please log in or sign up. Skip

? Do you want to use the default database (sqlite) ? No

? Choose your default database client postgres
? Database name: uba_provider

? Host: 127.0.0.1

? Port: 5432

? Username: strapi_db_user

? Password: **************

? Enable SSL connection: No

? Start with an example structure & data? No

? Start with Typescript? Yes

? Install dependencies with npm? Yes

? Initialize a git repository? No
```

#### 4. Admin Setup
- Open strapi admin URL
- Create admin account
- Login to admin panel

#### 5. Custom Collection
Later, a custom collection was created using Strapi admin UI. The files generated for custom collection were added to git repo.

### Reference Documentation
- [Strapi Quick Start Guide](https://docs.strapi.io/cms/quick-start)
- [Strapi Docker Installation](https://docs.strapi.io/cms/installation/docker)