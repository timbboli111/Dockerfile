
FROM alpine:latest

# Install wget dan unzip untuk ambil file Xray
RUN apk add --no-cache ca-certificates wget unzip

# Download Xray resmi (Versi Linux 64-bit)
RUN wget https://github.com/XTLS/Xray-core/releases/latest/download/Xray-linux-64.zip && \
    unzip Xray-linux-64.zip && \
    mv xray /usr/local/bin/xray && \
    chmod +x /usr/local/bin/xray && \
    rm -rf Xray-linux-64.zip

# Buat config langsung di dalam
RUN echo '{"inbounds":[{"port":8080,"protocol":"vless","settings":{"clients":[{"id":"6d2f9a1b-e8c4-4b3a-9d72-f5a81c0e92d7"}],"decryption":"none"},"streamSettings":{"network":"ws","wsSettings":{"path":"/vless-ws"}}}],"outbounds":[{"protocol":"freedom"}]}' > /etc/config.json

# Jalankan
CMD ["xray", "-config", "/etc/config.json"]
