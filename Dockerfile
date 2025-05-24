FROM n8nio/n8n:latest

USER root

# Install langfuse globally
RUN npm install -g langfuse

# Find where n8n is installed and install langfuse there too
RUN npm list -g n8n
RUN find /usr -name "n8n" -type d 2>/dev/null

# Install langfuse directly in n8n's node_modules
RUN cd /usr/local/lib/node_modules/n8n && npm install langfuse

# Also install in the working directory
WORKDIR /home/node
RUN npm init -y && npm install langfuse

# Set comprehensive NODE_PATH
ENV NODE_PATH=/usr/local/lib/node_modules:/usr/local/lib/node_modules/n8n/node_modules:/home/node/node_modules

# Switch back to n8n user
USER node
WORKDIR /home/node