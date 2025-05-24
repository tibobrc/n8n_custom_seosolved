FROM n8nio/n8n

USER root

# Install your custom packages globally
RUN npm install -g langfuse@3.37.2
RUN npm install -g @google/genai@1.0.1
RUN npm install -g @anthropic-ai/sdk@0.52.0
RUN npm install -g open@4.103.0

USER node