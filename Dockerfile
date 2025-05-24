# Use the official n8n image as base
FROM n8nio/n8n:latest

# Switch to root user to install packages
USER root

# Option 1: Install packages globally
# RUN npm install -g langfuse

# Option 2: Install packages in n8n's node_modules (more integrated)
WORKDIR /usr/local/lib/node_modules/n8n
RUN npm install langfuse

# Option 3: Create a custom package.json for additional dependencies
# COPY package.json /tmp/
# WORKDIR /tmp
# RUN npm install
# RUN cp -r node_modules/* /usr/local/lib/node_modules/n8n/node_modules/

# Install system packages if needed (e.g., for native dependencies)
# RUN apk add --no-cache python3 make g++

# Switch back to the n8n user for security
USER node

# Set working directory back to n8n's default
WORKDIR /home/node

# Optional: Set any additional environment variables
ENV NODE_PATH=/usr/local/lib/node_modules/n8n/node_modules

# The original CMD from the base image will be inherited