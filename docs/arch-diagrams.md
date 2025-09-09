# Architecture Diagrams

Visual representations of the UBI Strapi Provider's architecture and data flows.

## System Architecture

### High-Level Overview

```mermaid
graph TB
    subgraph "Strapi CMS"
        style CMS fill:#f3e5f5,stroke:#7b1fa2
        CMS[Strapi Core]

        subgraph "Content Types"
            BT[Benefits]
            FT[Forms]
            DT[Documents]
            style BT fill:#f3e5f5,stroke:#7b1fa2
            style FT fill:#f3e5f5,stroke:#7b1fa2
            style DT fill:#f3e5f5,stroke:#7b1fa2
        end

        subgraph "Admin Interface"
            AP[Admin Panel]
            ML[Media Library]
            style AP fill:#e1f5fe,stroke:#01579b
            style ML fill:#e1f5fe,stroke:#01579b
        end

        subgraph "API Layer"
            REST[REST API]
            GQL[GraphQL API]
            style REST fill:#fff8e1,stroke:#ffa000
            style GQL fill:#fff8e1,stroke:#ffa000
        end
    end

    subgraph "Data Layer"
        DB[(PostgreSQL)]
        FS[File Storage]
        style DB fill:#e8f5e9,stroke:#2e7d32
        style FS fill:#fff3e0,stroke:#ef6c00
    end

    subgraph "External Systems"
        MW[Provider Middleware]
        UI[Provider UI]
        style MW fill:#fce4ec,stroke:#c2185b
        style UI fill:#fce4ec,stroke:#c2185b
    end

    AP --> CMS
    ML --> CMS
    CMS --> REST
    CMS --> GQL
    
    CMS --> BT
    CMS --> FT
    CMS --> DT
    
    BT --> DB
    FT --> DB
    DT --> DB
    ML --> FS
    
    REST --> MW
    REST --> UI
```

### Content Type Structure

```mermaid
erDiagram
    BENEFIT ||--o{ FORM_GROUP : contains
    FORM_GROUP ||--o{ FORM_FIELD : has
    BENEFIT ||--o{ DOCUMENT_REQUIREMENT : requires
    BENEFIT ||--o{ ELIGIBILITY_RULE : validates
    BENEFIT ||--o{ CALCULATION_RULE : calculates
    
    BENEFIT {
        string id PK
        string title
        string description
        string provider
        date validFrom
        date validTo
        string status
        json metadata
    }
    
    FORM_GROUP {
        string id PK
        string title
        number order
        string type
        boolean required
    }
    
    FORM_FIELD {
        string id PK
        string label
        string type
        string validation
        boolean required
        json options
    }
    
    DOCUMENT_REQUIREMENT {
        string id PK
        string documentType
        string format
        boolean required
        string purpose
    }
    
    ELIGIBILITY_RULE {
        string id PK
        string criteria
        string operator
        json value
        boolean required
    }
    
    CALCULATION_RULE {
        string id PK
        string type
        json formula
        string outputField
    }
```

### API Flow Diagram

```mermaid
sequenceDiagram
    participant MW as Provider Middleware
    participant API as Strapi API
    participant CMS as Strapi Core
    participant DB as PostgreSQL
    participant FS as File Storage

    MW->>API: GET /benefits
    API->>CMS: Process Request
    CMS->>DB: Query Benefits
    DB-->>CMS: Benefits Data
    CMS-->>API: Format Response
    API-->>MW: Benefits List

    MW->>API: GET /benefit/{id}
    API->>CMS: Process Request
    CMS->>DB: Query Benefit
    DB-->>CMS: Benefit Data
    CMS->>DB: Query Form Schema
    DB-->>CMS: Form Data
    CMS-->>API: Combined Response
    API-->>MW: Benefit Details

    MW->>API: POST /upload
    API->>CMS: Process Upload
    CMS->>FS: Store File
    FS-->>CMS: File Info
    CMS->>DB: Save Metadata
    DB-->>CMS: Confirmation
    CMS-->>API: Upload Result
    API-->>MW: File Details
```

## Component Details

### Benefit Management
- Benefit definition and configuration
- Form builder and schema management
- Document requirements specification
- Eligibility rules configuration
- Benefit calculation rules

### Form Management
- Dynamic form generation
- Field validation rules
- Multi-step form configuration
- Conditional field logic
- Form versioning

### Document Management
- Document type definitions
- Format specifications
- Validation requirements
- Storage configuration
- Access control

### API Features
- RESTful endpoints
- GraphQL support
- Authentication & authorization
- Rate limiting
- Response formatting

## Security Architecture

```mermaid
graph TB
    subgraph "Security Layers"
        subgraph "Access Control"
            AUTH[Authentication]
            RBAC[Role-Based Access]
            PERM[Permissions]
            style AUTH fill:#e8f5e9,stroke:#2e7d32
            style RBAC fill:#e8f5e9,stroke:#2e7d32
            style PERM fill:#e8f5e9,stroke:#2e7d32
        end

        subgraph "Data Security"
            CRYPT[Encryption]
            VALID[Validation]
            SANIT[Sanitization]
            style CRYPT fill:#fff3e0,stroke:#ef6c00
            style VALID fill:#fff3e0,stroke:#ef6c00
            style SANIT fill:#fff3e0,stroke:#ef6c00
        end

        subgraph "API Security"
            CORS[CORS]
            RATE[Rate Limiting]
            TOKEN[Token Management]
            style CORS fill:#f3e5f5,stroke:#7b1fa2
            style RATE fill:#f3e5f5,stroke:#7b1fa2
            style TOKEN fill:#f3e5f5,stroke:#7b1fa2
        end
    end

    AUTH --> RBAC
    RBAC --> PERM
    
    CRYPT --> DB
    VALID --> API
    SANIT --> API
    
    CORS --> API
    RATE --> API
    TOKEN --> API
```

## Notes

1. This architecture supports the Provider system's requirements for benefit and form management
2. The system is designed for extensibility and scalability
3. Security is implemented at multiple layers
4. APIs are versioned and documented
5. Data validation occurs at multiple levels