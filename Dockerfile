FROM n8nio/n8n:latest

USER root

# Install langfuse globally
RUN npm install -g langfuse

# Set NODE_PATH so n8n can find global modules
ENV NODE_PATH=/usr/local/lib/node_modules

USER node