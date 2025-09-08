# Architecture Diagrams

Basic visual representations of the UBI Strapi Provider's structure.

## System Overview

```mermaid
graph TB
    subgraph "UBI Strapi Provider"
        A[Admin Panel] --> B[Strapi Core]
        B --> C[API Layer]
        B --> D[Media Library]
        
        subgraph "Data Layer"
            F[PostgreSQL]
            G[Files]
        end
        
        B --> F
        D --> G
    end
    
    subgraph "Clients"
        L[Web Interface]
        M[API Clients]
    end
    
    C --> L
    C --> M
```

## Authentication Flow

```mermaid
sequenceDiagram
    participant C as Client
    participant S as Strapi
    participant DB as Database
    
    C->>S: Login Request
    S->>DB: Check Credentials
    DB-->>S: User Data
    S->>S: Create JWT
    S-->>C: Return JWT
    
    C->>S: API Request + JWT
    S->>S: Check JWT
    S->>DB: Get Data
    DB-->>S: Return Data
    S-->>C: Response
```

## Data Structure

```mermaid
erDiagram
    BENEFIT ||--o{ ELIGIBILITY : has
    BENEFIT ||--o{ APPLICATION : includes
    BENEFIT ||--o{ DOCUMENT : requires
    
    BENEFIT {
        string title
        string description
        date validFrom
        date validTo
        string status
    }
    
    ELIGIBILITY {
        string criteria
        string type
        boolean required
    }
    
    APPLICATION {
        string step
        number order
        string type
    }
```

## Notes

1. These are simplified diagrams for basic understanding
2. Actual implementation may have additional features
3. Use as a general reference for system structure