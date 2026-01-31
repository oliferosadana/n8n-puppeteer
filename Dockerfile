# Menggunakan n8n latest (yang berbasis Debian)
FROM n8nio/n8n:latest

USER root

# Gunakan apt-get (Debian) bukan apk (Alpine)
# Install Chromium dan font yang diperlukan agar tidak kotak-kotak saat render
RUN apt-get update && apt-get install -y \
    chromium \
    fonts-ipafont-gothic \
    fonts-wqy-zenhei \
    fonts-thai-tlwg \
    fonts-kacst \
    fonts-freefont-ttf \
    libxss1 \
    --no-install-recommends \
    && rm -rf /var/lib/apt/lists/*

# Setup Environment Variable untuk Puppeteer
ENV PUPPETEER_SKIP_CHROMIUM_DOWNLOAD=true \
    PUPPETEER_EXECUTABLE_PATH=/usr/bin/chromium

USER node

# Install puppeteer
RUN npm install puppeteer
