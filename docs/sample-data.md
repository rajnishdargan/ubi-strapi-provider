# API Examples

Quick reference for UBI Strapi Provider API usage.

## Authentication

1. Get token: Admin Panel → Settings → API Tokens
2. Use in requests:
```http
Authorization: Bearer your-api-token
```

## Benefits API

### List Benefits
```http
GET /api/benefits
```

### Get Single Benefit
```http
GET /api/benefits/1?populate=*
```

### Create Benefit
```http
POST /api/benefits
Content-Type: application/json

{
  "data": {
    "name": "Education Support",
    "description": "Educational support for students",
    "eligibility_criteria": {
      "age": "18-25",
      "income": "< 50000"
    }
  }
}
```

## Applications API

### Create Application
```http
POST /api/applications
Content-Type: application/json

{
  "data": {
    "benefit": 1,
    "applicant_name": "John Doe",
    "contact_email": "john@example.com",
    "application_data": {
      "income": 50000,
      "family_size": 4
    }
  }
}
```

### List Applications
```http
GET /api/applications?populate=*
```

## Query Parameters

- Filter: `?filters[name][$contains]=education`
- Sort: `?sort[0]=createdAt:desc`
- Paginate: `?pagination[page]=2&pagination[pageSize]=10`
- Populate: `?populate=benefit,files`

## File Upload

```http
POST /api/upload
Content-Type: multipart/form-data

file: <file_data>
```

## Common Errors

```json
{
  "error": {
    "status": 401,
    "message": "Invalid token"
  }
}
```

```json
{
  "error": {
    "status": 400,
    "message": "applicant_name is required"
  }
}
```