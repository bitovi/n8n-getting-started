FROM n8nio/n8n:latest

USER root

RUN npm install -g langfuse@3.18.0
RUN npm install -g langfuse-langchain@3.18.0
RUN npm install -g typescript@5.6.2
RUN npm install -g grunt

# Install bash and OpenSSL for certificate generation
RUN apk update && apk add --no-cache bash openssl

# Set proper ownership for npm global directories
RUN chown -R node:node /usr/local/lib /usr/local/bin

USER node

# Create directory for certificates
RUN mkdir -p /home/node/certificates
WORKDIR /home/node/certificates

# Generate self-signed certificate
RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
    -keyout n8n-key.pem -out n8n-cert.pem \
    -subj "/C=US/ST=State/L=City/O=Organization/CN=localhost"

# Set proper permissions for the private key
RUN chmod 600 /home/node/certificates/n8n-key.pem

# Set environment variables for SSL configuration
ENV N8N_PROTOCOL=https
ENV N8N_SSL_KEY=/home/node/certificates/n8n-key.pem
ENV N8N_SSL_CERT=/home/node/certificates/n8n-cert.pem

# You can set a custom entrypoint here to check the certificate files before starting n8n
# or use the default one provided by the base image