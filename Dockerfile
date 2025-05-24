FROM n8nio/n8n

USER root

# Install your custom packages globally
RUN npm install -g langfuse@3.37.2

USER node