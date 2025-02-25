
# N8N-Getting-Started: Grafana
This example shows how to add an **Grafana service** to your local N8N deployment using docker-compose.

### Step 1. Update the docker-compose.yml

```yaml
services:
  ...
  grafana:
    image: grafana/grafana
    container_name: grafana
    ports:
      - 3002:3000
    restart: unless-stopped
    environment:
      - GF_SECURITY_ADMIN_USER=admin
      - GF_SECURITY_ADMIN_PASSWORD=grafana
    volumes:
      - ./config:/etc/grafana/provisioning/datasources
```
