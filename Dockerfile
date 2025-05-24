FROM n8nio/n8n:latest

# Switch to node user and install in user directory (most reliable)
USER node
WORKDIR /home/node

# Initialize npm and install langfuse locally
RUN npm init -y
RUN npm install langfuse

# Verify installation
RUN ls -la node_modules/ | grep langfuse