#!/bin/bash
LATEST_VER=$(curl -s https://api.github.com/repos/perfect-panel/server/releases/latest | jq -r '.tag_name')
SERVER_URL="https://github.com/perfect-panel/server/releases/download/v1.0.5/ppanel-server-linux-amd64.tar.gz"
mkdir -p /opt/ppanel
wget -O /opt/ppanel-server.tar.gz https://github.com/perfect-panel/server/releases/download/v1.0.5/ppanel-server-linux-amd64.tar.gz
tar -xvf /opt/ppanel-server.tar.gz -C /opt/ppanel/
