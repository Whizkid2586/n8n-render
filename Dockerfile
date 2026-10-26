FROM n8nio/n8n:latest

# Switch to root to install system dependencies
USER root

# Update system package list and install Python3, pip, and FFmpeg
RUN apt-get update && apt-get install -y \
    python3 \
    python3-pip \
    ffmpeg \
    && rm -rf /var/lib/apt/lists/*

# Install edge-tts globally via Python
RUN pip3 install --no-cache-dir --break-system-packages edge-tts

# Switch back to the standard n8n user for security
USER node
