# N8N-Getting-Started: Langfuse
This example shows how to add an **Langfuse service** to your local N8N deployment using docker-compose.

### Step 1. Update the docker-compose.yml

```yaml
services:
  ...
  langfuse:
    image: langfuse/langfuse:2
    depends_on:
        pg-langfuse:
        condition: service_healthy
    ports:
        - "3001:3000"
    env_file:
        - Langfuse/.env-langfuse
    environment:
        - DATABASE_URL=postgresql://langfuse:password@pg-langfuse:5433/langfuse
        - NEXTAUTH_URL=http://localhost:3001
        - TELEMETRY_ENABLED=${TELEMETRY_ENABLED:-true}
        - LANGFUSE_ENABLE_EXPERIMENTAL_FEATURES=${LANGFUSE_ENABLE_EXPERIMENTAL_FEATURES:-true}

  pg-langfuse:
    image: postgres
    restart: always
    command: postgres -p 5433
    healthcheck:
      test: ["CMD-SHELL", "pg_isready -U langfuse -p 5433"]
      interval: 3s
      timeout: 3s
      retries: 10
    env_file:
      - .env-pg-langfuse
    environment:
      - POSTGRES_DB=langfuse
    ports:
      - 5433:5433
    volumes:
      - pg_langfuse_data:/var/lib/postgresql/data

volumes:
  ...
  pg_langfuse_data:
```

### Step 2. Create the environment files
Copy the file `Langfuse/.env-langfuse.example` renaming it to `.env-langfuse` within the Langfuse folder.
Copy the file `Langfuse/..env-pg-langfuse.example` renaming it to `.env-pg-langfuse` within the Langfuse folder.
