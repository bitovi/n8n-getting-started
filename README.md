# N8N-Getting-Started: N8N
This example shows how to run a local **N8N service** using docker-compose.

## Prerequisites
    - [Git](https://github.com/)
    - [Docker](https://docs.docker.com/engine/install/)
    - [Docker-Compose](https://docs.docker.com/compose/install/)

## Instructions
### Step 1. Clone the repo
Clone the repo to your local machine by running the following command:

```bash
git clone git@github.com:bitovi/n8n-getting-started.git
```

### Step 2. Create the environment file
Copy the file `.env-n8n.example` renaming it to `.env-n8n` within the project's root folder.

### Step 3. Start the service
Start the docker-compose service by running the following command:

```bash
docker-compose up --build
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
This repo contains folders with additional docker-compose files for other services that can be run in conjunction with N8N. 

To use these additional services use the following command:
```bash
docker-compose -f docker-compose.yml -f <Service>/docker-compose.yml up
```

Where `<Service>` is the name of the service you want to run. For example, to run N8N with Postgres, use the following command:

```bash
docker-compose -f docker-compose.yml -f Postgres/docker-compose.yml up
```

Have fun N8N-ing!