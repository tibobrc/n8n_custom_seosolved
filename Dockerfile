FROM n8nio/n8n:latest

USER root

# Debug: Check npm configuration and install locations
RUN echo "=== NPM Configuration ===" && \
    npm config get prefix && \
    npm config get globaldir && \
    npm root -g

# Install langfuse globally
RUN npm install -g langfuse

# Debug: Verify installation and find actual location
RUN echo "=== After Installation ===" && \
    npm list -g langfuse && \
    find /usr -name "langfuse" -type d 2>/dev/null || true && \
    ls -la $(npm root -g) | grep langfuse || echo "langfuse not found in global root"

# Set NODE_PATH to the actual global modules directory
RUN echo "export NODE_PATH=$(npm root -g):$NODE_PATH" >> /etc/environment
ENV NODE_PATH=/usr/local/lib/node_modules:/usr/lib/node_modules