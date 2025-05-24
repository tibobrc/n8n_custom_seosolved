FROM n8nio/n8n:latest

# Switch to n8n user immediately
USER node
WORKDIR /home/node

# Install langfuse directly in the working directory
RUN npm init -y
RUN npm install langfuse

# Verify the installation
RUN ls -la node_modules/langfuse/