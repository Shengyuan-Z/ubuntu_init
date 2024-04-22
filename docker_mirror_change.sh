#!/bin/bash

set -e  # Exit immediately if a command exits with a non-zero status

# Configure Docker daemon
if echo '{ "registry-mirrors" : [ "https://registry.docker-cn.com", "http://hub-mirror.c.163.com", "https://docker.mirrors.ustc.edu.cn", "https://cr.console.aliyun.com", "https://mirror.ccs.tencentyun.com" ] }' | \
   sudo tee /etc/docker/daemon.json > /dev/null; then
    echo "Successfully configured Docker daemon"
else
    echo "Failed to configure Docker daemon, exiting script" >&2
    exit 1
fi

# Reload systemd daemon
if sudo systemctl daemon-reload; then
    echo "Successfully reloaded systemd daemon"
else
    echo "Failed to reload systemd daemon, exiting script" >&2
    exit 1
fi

# Restart Docker service
if sudo systemctl restart docker.service; then
    echo "Successfully restarted Docker service"
else
    echo "Failed to restart Docker service, exiting script" >&2
    exit 1
fi

# Display Docker info
if docker info; then
    echo "Successfully displayed Docker info"
else
    echo "Failed to display Docker info, exiting script" >&2
    exit 1
fi

echo "Docker configuration completed successfully"