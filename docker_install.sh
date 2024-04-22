#!/bin/bash

set -e  # Exit immediately if a command exits with a non-zero status

# Update package lists
if sudo apt-get update; then
    echo "Successfully updated package lists"
else
    echo "Failed to update package lists, exiting script" >&2
    exit 1
fi

# Install required packages
if sudo apt-get install ca-certificates curl -y; then
    echo "Successfully installed ca-certificates and curl"
else
    echo "Failed to install ca-certificates and curl, exiting script" >&2
    exit 1
fi

# Create the directory for Docker's GPG key
if sudo install -m 0755 -d /etc/apt/keyrings; then
    echo "Successfully created /etc/apt/keyrings directory"
else
    echo "Failed to create /etc/apt/keyrings directory, exiting script" >&2
    exit 1
fi

# Download Docker's official GPG key
if sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc; then
    echo "Successfully downloaded Docker's GPG key"
else
    echo "Failed to download Docker's GPG key, exiting script" >&2
    exit 1
fi

# Set the correct permissions for the GPG key
if sudo chmod a+r /etc/apt/keyrings/docker.asc; then
    echo "Successfully set permissions for Docker's GPG key"
else
    echo "Failed to set permissions for Docker's GPG key, exiting script" >&2
    exit 1
fi

# Add the Docker repository to Apt sources
if echo \
    "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
    $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
    sudo tee /etc/apt/sources.list.d/docker.list > /dev/null; then
    echo "Successfully added Docker repository to Apt sources"
else
    echo "Failed to add Docker repository to Apt sources, exiting script" >&2
    exit 1
fi

# Update package lists
if sudo apt-get update; then
    echo "Successfully updated package lists"
else
    echo "Failed to update package lists, exiting script" >&2
    exit 1
fi

# Install Docker components
if sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin -y; then
    echo "Successfully installed Docker components"
else
    echo "Failed to install Docker components, exiting script" >&2
    exit 1
fi

# Run the hello-world Docker container to verify the installation
if sudo docker run hello-world; then
    echo "Docker installation verified successfully"
else
    echo "Failed to verify Docker installation, exiting script" >&2
    exit 1
fi

echo "Docker installation completed successfully"
