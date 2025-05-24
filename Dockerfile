FROM n8nio/n8n:latest

USER root

# Install langfuse globally first
RUN npm install -g langfuse

# Create n8n working directory and copy langfuse there
WORKDIR /home/node
RUN mkdir -p node_modules

# Copy the installed langfuse module to where n8n can find it
RUN cp -r /usr/local/lib/node_modules/langfuse /home/node/node_modules/
RUN cp -r /usr/local/lib/node_modules/langfuse/node_modules/* /home/node/node_modules/ 2>/dev/null || true

# Also create a package.json in case n8n needs it
RUN echo '{ "name": "n8n-custom", "version": "1.0.0", "dependencies": { "langfuse": "*" } }' > package.json

# Fix permissions
RUN chown -R node:node /home/node

USER node
WORKDIR /home/node