#!/bin/bash
set -e

LATEST_VER=$(curl -s https://api.github.com/repos/perfect-panel/server/releases/latest | jq -r '.tag_name')
SERVER_URL="https://github.com/perfect-panel/server/releases/download/${LATEST_VER}/ppanel-server-${LATEST_VER}-linux-amd64.tar.gz"

echo "Downloading ppanel-server version: ${LATEST_VER}"
echo "URL: ${SERVER_URL}"

mkdir -p /opt/ppanel

# 验证链接是否存在
if curl --head --silent --fail "${SERVER_URL}" > /dev/null; then
    echo "Download link valid, proceed to download..."
    wget -O /opt/ppanel-server.tar.gz "${SERVER_URL}"
    tar -xvf /opt/ppanel-server.tar.gz -C /opt/ppanel/
else
    echo "Error: Download link not found: ${SERVER_URL}"
    exit 1
fi
