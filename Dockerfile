FROM n8nio/n8n:1.62.1

USER root

RUN npm install -g langfuse@3.18.0
RUN npm install -g langfuse-langchain@3.18.0
RUN npm install -g typescript@5.6.2
RUN npm install -g grunt

# Install bash in the existing base image
RUN apk update && apk add --no-cache bash
RUN chown -R node:node /usr/local/lib /usr/local/bin

USER node