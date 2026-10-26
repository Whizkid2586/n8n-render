FROM python:3.11-slim

# Install system dependencies (Node.js, npm, and FFmpeg)
RUN apt-get update && apt-get install -y \
    curl \
    ffmpeg \
    && curl -fsSL https://deb.nodesource.com/setup_20.x | bash - \
    && apt-get install -y nodejs \
    && rm -rf /var/lib/apt/lists/*

# Install n8n globally via npm
RUN npm install -g n8n

# Install edge-tts globally via Python pip
RUN pip install --no-cache-dir edge-tts

# Expose n8n port
EXPOSE 5678

# Set working directory
WORKDIR /data

# Start n8n
CMD ["n8n"]
