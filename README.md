# n8n-Getting-Started: n8n

This example shows how to run a local **n8n service** using docker-compose.

## Prerequisites

- [Git](https://github.com/)
- [Docker](https://docs.docker.com/engine/install/)
- [Docker-Compose](https://docs.docker.com/compose/install/) **Only needed for older versions of Docker**

Uh oh. You have a newer version of Docker (> 4.41) that only supports the newer `docker compose`
plugin, but all the scripts in this repo depend on `docker-compose` - what to do? There's a solution
for **MacOS**! Run the following commands to create an executable script that will invoke `docker
compose` when `docker-compose` is requested.

```sh
sudo touch /usr/local/bin/docker-compose
echo 'docker compose --compatibility "$@"' | sudo tee /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
```

Because Docker's running with "compatibility" you won't have access to some of the nice features
that `docker compose` supports like automatically showing logs after starting a container.

## Instructions

### Step 1. Clone the repo

Clone the repo to your local machine by running the following command:

```sh
git clone https://github.com/bitovi/n8n-getting-started.git
```

Or if you insist on SSH

```bash
git clone git@github.com:bitovi/n8n-getting-started.git
```

### Step 2. Start the service

Start the docker-compose service by running the following command:

```bash
docker-compose up --build
```

### Step 3. Validate the service is running

For older versions of Docker watch the logs to ensure the service is running:

```bash
docker-compose logs -f
```

The tail of the logs should show the following message:

```bash
Editor is now accessible via:
https://localhost:5678/
```

### Step 4. Access the service

Open a browser and navigate to the following URL: [https://localhost:5678/](https://localhost:5678/)

Note: we use self-signed certificates for local development to enable Oauth callbacks for 3rd party integrations, e.g. Slack.

## Next Steps

This repo contains folders with additional docker-compose files for other services that can be run in conjunction with n8n.

To use these additional services use the following command:

```bash
docker-compose -f docker-compose.yml -f <Service>/docker-compose.yml up
```

Where `<Service>` is the name of the service you want to run. For example, to run n8n with Postgres, use the following command:

```bash
docker-compose -f docker-compose.yml -f Postgres/docker-compose.yml up
```

For convenience, a wrapper script has been added to make this less clunky. The `./up` command will startup n8n and takes a list of additional services to run with it.

```bash
./up Postgres
```

## Adminer

Adminer is a database management tool that can be used to manage the databases used by n8n. To access Adminer, navigate to the following URL: [http://localhost:8080/](http://localhost:8080/)

The credentials are pulled directly from the database environment variables.
For example, if you are using Postgres, the credentials are:

```bash
System: Postgres
Server: pg-n8n
Username: n8n
Password: password
Database: n8n
```

## Additional Tools (Optional)

The main services you will need are n8n and Postgres, but you can also run additional tools to enhance your n8n experience. You can verify deployment of the following:

- [LangFuse](https://langfuse.com/) at [localhost:3001](http://localhost:3001) (create a local account)

  - Create .env-langfuse from the example (`/Langfuse/env-langfuse.example`)
  - Create .env-pg-langfuse from the example (`/Langfuse/env-pg-langfuse.example`)
  - Run `docker-compose -f docker-compose.yml -f Langfuse/docker-compose.yml up -d`

- [Grafana](https://grafana.com/) at [localhost:3002](http://localhost:3002) (user: admin / password: grafana)

  - Run `docker-compose -f docker-compose.yml -f Grafana/docker-compose.yml up -d`

- [Prometheus](https://prometheus.io/) at [localhost:9090](http://localhost:9090)

  - Run `docker-compose -f docker-compose.yml -f Prometheus/docker-compose.yml up -d`

- [Qdrant](https://qdrant.tech/) at [localhost:6333/dashboard](http://localhost:6333/dashboard)
  - Run `docker-compose -f docker-compose.yml -f Qdrant/docker-compose.yml up -d`
  - Go ahead and create an api key and n8n credential while you’re at it
  - Define your own api key in Qdrant by clicking the key in the right of the top menu

## Conclusion

Have fun n8n-ing!
