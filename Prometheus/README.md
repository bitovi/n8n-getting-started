# N8N-Getting-Started: Prometheus
This example shows how to add an **Prometheus service** to your local N8N deployment using docker-compose.

### Step 1. Update the docker-compose.yml

```yaml
services:
  ...
  prometheus:
    image: prom/prometheus
    container_name: prometheus
    command:
      - '--config.file=/etc/prometheus/prometheus.yml'
    ports:
      - 9090:9090
    restart: unless-stopped
    volumes:
      - ./config:/etc/prometheus
      - prom_data:/prometheus
volumes:
  ...
  prom_data:
```
