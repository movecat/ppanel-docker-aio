#!/bin/bash
set -e

SERVER_URL="https://github.com/perfect-panel/server/releases/download/v1.0.5/ppanel-server-linux-amd64.tar.gz"

echo "Downloading fixed version from:"
echo "${SERVER_URL}"

mkdir -p /opt/ppanel

# 下载文件
if curl --head --silent --fail "$SERVER_URL" > /dev/null; then
    wget -O /opt/ppanel-server.tar.gz "$SERVER_URL"
    tar -xvf /opt/ppanel-server.tar.gz -C /opt/ppanel/
else
    echo "❌ ERROR: URL Not Found: $SERVER_URL"
    exit 1
fi
