# Menggunakan base image n8n resmi
FROM n8nio/n8n:latest

# Mengubah user ke root untuk install package sistem
USER root

# Install Chromium dan dependensi yang dibutuhkan Puppeteer
# Kita menggunakan Alpine repo (karena n8n base-nya seringkali Alpine)
RUN apk add --no-cache \
    chromium \
    nss \
    freetype \
    harfbuzz \
    ca-certificates \
    ttf-freefont \
    nodejs \
    npm

# Set Environment Variable agar Puppeteer menggunakan Chromium yang kita install
# dan men-skip download chromium bawaan puppeteer (untuk menghemat space)
ENV PUPPETEER_SKIP_CHROMIUM_DOWNLOAD=true \
    PUPPETEER_EXECUTABLE_PATH=/usr/bin/chromium-browser

# Kembali ke user node (keamanan)
USER node

# Install puppeteer di folder n8n agar bisa dipanggil
RUN npm install puppeteer
