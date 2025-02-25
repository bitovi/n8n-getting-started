# N8N-Getting-Started: N8N
This example shows how to run a local **N8N service** using docker-compose.

## Prerequisites

## Instructions

### Step 1. Create the environment file
Copy the file `.env-n8n.example` renaming it to `.env-n8n` within the project's root folder.

### Step 2. Start the service
Start the docker-compose service by running the following command:

```bash
docker-compose up
```

### Step 3. Validate the service is running
Watch the logs to ensure the service is running:

```bash
docker-compose logs -f
```

The tail of the logs should show the following message:

```bash
Editor is now accessible via:
https://localhost:5678/
```

### Step 4. Access the service
Open a browser and navigate to the following URL: https://localhost:5678/



## Next Steps

This repo contains folders that demonstrates how to add additional services to the N8N service. The following services are available:

- [N8N with Postgres](./Postgres/README.md)
- [N8N with Langfuse](./Langfuse/README.md)
- [N8N with Prometheus](./Prometheus/README.md)
- [N8N with Grafana](./Grafana/README.md)
- [N8N with Qdrant](./Qdrant/README.md)

Have fun N8N-ing!