FROM n8nio/n8n:latest

# Switch to root to install system dependencies
USER root

# Install Python3, pip, and FFmpeg
RUN apk add --no-cache python3 py3-pip ffmpeg

# Install edge-tts globally via Python
RUN pip3 install --no-cache-dir edge-tts

# Switch back to the standard n8n user for security
USER node
