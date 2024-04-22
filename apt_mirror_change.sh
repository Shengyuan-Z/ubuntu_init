#!/bin/bash

set -e  # Exit immediately if a command exits with a non-zero status

# Backup sources.list
if mv /etc/apt/sources.list /etc/apt/sources.list.bak; then
    echo "Successfully backed up /etc/apt/sources.list"
else
    echo "Failed to backup /etc/apt/sources.list, exiting script" >&2
    exit 1
fi

# Generate new sources.list
if cat << EOF > /etc/apt/sources.list
# Source code mirrors are commented out by default to speed up apt update, uncomment if needed
deb https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ jammy main restricted universe multiverse
# deb-src https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ jammy main restricted universe multiverse
deb https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ jammy-updates main restricted universe multiverse
# deb-src https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ jammy-updates main restricted universe multiverse
deb https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ jammy-backports main restricted universe multiverse
# deb-src https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ jammy-backports main restricted universe multiverse
deb http://security.ubuntu.com/ubuntu/ jammy-security main restricted universe multiverse
# deb-src http://security.ubuntu.com/ubuntu/ jammy-security main restricted universe multiverse
# Pre-release software sources, not recommended to enable
# deb https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ jammy-proposed main restricted universe multiverse 
# deb-src https://mirrors.tuna.tsinghua.edu.cn/ubuntu/ jammy-proposed main restricted universe multiverse
EOF
then
    echo "Successfully generated new /etc/apt/sources.list"
else
    echo "Failed to generate new /etc/apt/sources.list, exiting script" >&2
    exit 1
fi

# Update package lists
if sudo apt-get update; then
    echo "Successfully updated package lists"
else
    echo "Failed to update package lists, exiting script" >&2
    exit 1
fi