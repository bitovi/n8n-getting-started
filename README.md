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

### Step 2. Start the service
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
Open a browser and navigate to the following URL: [http://localhost:5678/](http://localhost:5678/)


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

## Adminer
Adminer is a database management tool that can be used to manage the databases used by N8N. To access Adminer, navigate to the following URL: [http://localhost:8080/](http://localhost:8080/)

The credentials are pulled directly from the database environment variables. 
For example, if you are using Postgres, the credentials are:

```bash
System: Postgres
Server: pg-n8n
Username: n8n
Password: password
Database: n8n
```

## Conclusion
Have fun N8N-ing!
