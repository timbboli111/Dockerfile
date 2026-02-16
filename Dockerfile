FROM alpine:latest
ENV PORT=8080
RUN apk add --no-cache xray ca-certificates

# Copy config kamu
COPY config.json /etc/xray/config.json

# Jalankan Xray
CMD ["/usr/bin/xray", "-config", "/etc/xray/config.json"]
