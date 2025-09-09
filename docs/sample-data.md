# Sample Data

This document provides sample data structures and examples for testing the UBI Strapi Provider.

## Benefit Schema

### Content Type Structure

```typescript
interface Benefit {
  title: string;
  description: string;
  status: 'draft' | 'published' | 'archived';
  validFrom: Date;
  validTo: Date;
  eligibilityCriteria: EligibilityCriteria[];
  applicationProcess: ApplicationProcess[];
  financialBenefit?: FinancialBenefit;
  nonMonetaryBenefit?: NonMonetaryBenefit;
  providingEntity: ProvidingEntity;
  sponsoringEntity?: SponsoringEntity;
  documents: Document[];
  tags: Tag[];
}
```

### Sample Benefit Data

```json
{
  "title": "Monthly Basic Income Support",
  "description": "Financial assistance program providing monthly support to eligible residents",
  "status": "published",
  "validFrom": "2024-01-01T00:00:00.000Z",
  "validTo": "2024-12-31T23:59:59.999Z",
  "eligibilityCriteria": [
    {
      "criteria": "Age requirement",
      "description": "Must be 18 years or older",
      "type": "age",
      "value": 18,
      "operator": "greaterThanOrEqual"
    },
    {
      "criteria": "Residency",
      "description": "Must be a resident for at least 2 years",
      "type": "duration",
      "value": 2,
      "unit": "years",
      "operator": "greaterThanOrEqual"
    },
    {
      "criteria": "Income threshold",
      "description": "Annual household income below threshold",
      "type": "income",
      "value": 300000,
      "operator": "lessThan"
    }
  ],
  "applicationProcess": [
    {
      "step": "Personal Information",
      "order": 1,
      "fields": [
        {
          "name": "fullName",
          "type": "text",
          "required": true,
          "label": "Full Name"
        },
        {
          "name": "dateOfBirth",
          "type": "date",
          "required": true,
          "label": "Date of Birth"
        }
      ]
    },
    {
      "step": "Address Details",
      "order": 2,
      "fields": [
        {
          "name": "addressLine1",
          "type": "text",
          "required": true,
          "label": "Address Line 1"
        },
        {
          "name": "city",
          "type": "text",
          "required": true,
          "label": "City"
        }
      ]
    }
  ],
  "financialBenefit": {
    "amount": 5000,
    "currency": "INR",
    "frequency": "monthly",
    "duration": 12,
    "durationUnit": "months"
  },
  "providingEntity": {
    "name": "State Welfare Department",
    "type": "government",
    "contactInfo": {
      "email": "welfare@state.gov.in",
      "phone": "+91-1234567890"
    }
  },
  "documents": [
    {
      "name": "Identity Proof",
      "type": "identity",
      "required": true,
      "acceptedFormats": ["pdf", "jpg", "png"],
      "description": "Government issued photo ID"
    },
    {
      "name": "Income Certificate",
      "type": "income",
      "required": true,
      "acceptedFormats": ["pdf"],
      "description": "Latest income certificate from authorized authority"
    }
  ],
  "tags": [
    {
      "name": "Financial Aid",
      "type": "category"
    },
    {
      "name": "Monthly",
      "type": "frequency"
    }
  ]
}
```

## Component Examples

### Address Component

```json
{
  "addressLine1": "123 Main Street",
  "addressLine2": "Apartment 4B",
  "city": "Mumbai",
  "state": "Maharashtra",
  "country": "India",
  "pincode": "400001",
  "type": "residential"
}
```

### Application Form Field

```json
{
  "name": "monthlyIncome",
  "label": "Monthly Household Income",
  "type": "number",
  "required": true,
  "validation": {
    "min": 0,
    "max": 100000
  },
  "helpText": "Enter total monthly income from all sources",
  "placeholder": "Enter amount in INR",
  "options": [],
  "group": "Financial Information"
}
```

### Eligibility Criteria

```json
{
  "criteria": "Employment Status",
  "description": "Must be currently unemployed",
  "type": "employment",
  "value": "unemployed",
  "operator": "equals",
  "required": true,
  "validationMessage": "Only unemployed individuals are eligible",
  "documentRequired": true
}
```

## API Examples

### Create Benefit

```bash
curl -X POST 'http://localhost:1337/api/benefits' \
-H 'Authorization: Bearer YOUR_TOKEN' \
-H 'Content-Type: application/json' \
-d '{
  "data": {
    "title": "Education Support Program",
    "description": "Financial assistance for higher education",
    "status": "draft",
    "validFrom": "2024-01-01",
    "validTo": "2024-12-31"
  }
}'
```

### Query Benefits

```bash
# Get all published benefits
curl 'http://localhost:1337/api/benefits?filters[status][$eq]=published'

# Get benefits with populated relationships
curl 'http://localhost:1337/api/benefits?populate=*'

# Get benefits with specific fields
curl 'http://localhost:1337/api/benefits?fields[0]=title&fields[1]=description'
```

## Testing Data

### Test User

```json
{
  "username": "testuser",
  "email": "test@example.com",
  "password": "Test@123",
  "role": "authenticated"
}
```

### Test API Token

```json
{
  "name": "Test API Token",
  "description": "Token for testing API endpoints",
  "type": "read-only",
  "token": "YOUR_GENERATED_TOKEN"
}
```

## Data Import/Export

### Export Collection

```bash
# Export benefits collection
strapi export-content --collection benefits --format json > benefits.json

# Export specific fields
strapi export-content --collection benefits --fields title,description > benefits-basic.json
```

### Import Collection

```bash
# Import benefits
strapi import-content --collection benefits --file benefits.json

# Dry run import
strapi import-content --collection benefits --file benefits.json --dry-run
```

## Validation Rules

### Benefit Validation

```javascript
{
  title: {
    required: true,
    minLength: 3,
    maxLength: 100
  },
  validFrom: {
    required: true,
    type: 'date'
  },
  validTo: {
    required: true,
    type: 'date',
    min: 'validFrom'
  },
  status: {
    required: true,
    enum: ['draft', 'published', 'archived']
  }
}
```

## GraphQL Queries

### Get Benefit

```graphql
query GetBenefit($id: ID!) {
  benefit(id: $id) {
    data {
      id
      attributes {
        title
        description
        status
        validFrom
        validTo
        eligibilityCriteria {
          criteria
          description
          type
        }
        financialBenefit {
          amount
          currency
          frequency
        }
      }
    }
  }
}
```

## Notes

1. All sample data is for testing purposes only
2. Replace sensitive values (tokens, passwords) with your own secure values
3. Adjust data according to your specific requirements
4. Use appropriate error handling in production
5. Follow security best practices when handling real data
