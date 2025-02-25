# N8N-Getting-Started: Postgres
This example shows how to add an **Postgres database** to your local N8N deployment using docker-compose.

### Step 1. Update the docker-compose.yml

```yaml
services:
  n8n:
    ...
    environment:
      - DB_TYPE=postgresdb
      - DB_POSTGRESDB_DATABASE=n8n
      - DB_POSTGRESDB_HOST=pg-n8n
      - DB_POSTGRESDB_PORT=5432

  pg-n8n:
    image: postgres:12
    restart: always
    env_file:
    - Postgres/.env-pg-n8n
    environment:
    POSTGRES_DB: n8n
    volumes:
    - pg_n8n_data:/var/lib/postgresql/data
volumes:
  pg_n8n_data:
```

### Step 2. Create the environment file

Copy the file `Postgres/.env-pg-n8n.example` renaming it to `.env-pg-n8n` within the Postgres folder.
