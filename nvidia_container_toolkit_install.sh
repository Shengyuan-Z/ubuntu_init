#!/bin/bash

set -e  # Exit immediately if a command exits with a non-zero status

# Add the NVIDIA Container Toolkit GPG key
if curl -fsSL https://nvidia.github.io/libnvidia-container/gpgkey | sudo gpg --dearmor -o /usr/share/keyrings/nvidia-container-toolkit-keyring.gpg; then
    echo "Successfully added the NVIDIA Container Toolkit GPG key"
else
    echo "Failed to add the NVIDIA Container Toolkit GPG key, exiting script" >&2
    exit 1
fi

# Add the NVIDIA Container Toolkit repository to the sources list
if curl -s -L https://nvidia.github.io/libnvidia-container/stable/deb/nvidia-container-toolkit.list | \
   sed 's#deb https://#deb [signed-by=/usr/share/keyrings/nvidia-container-toolkit-keyring.gpg] https://#g' | \
   sudo tee /etc/apt/sources.list.d/nvidia-container-toolkit.list > /dev/null; then
    echo "Successfully added the NVIDIA Container Toolkit repository to the sources list"
else
    echo "Failed to add the NVIDIA Container Toolkit repository to the sources list, exiting script" >&2
    exit 1
fi

# Update the package lists
if sudo apt-get update; then
    echo "Successfully updated the package lists"
else
    echo "Failed to update the package lists, exiting script" >&2
    exit 1
fi

# Install the NVIDIA Container Toolkit
if sudo apt-get install -y nvidia-container-toolkit; then
    echo "Successfully installed the NVIDIA Container Toolkit"
else
    echo "Failed to install the NVIDIA Container Toolkit, exiting script" >&2
    exit 1
fi

# Restart the Docker service
if sudo systemctl restart docker; then
    echo "Successfully restarted the Docker service"
else
    echo "Failed to restart the Docker service, exiting script" >&2
    exit 1
fi

# Run the NVIDIA System Management Interface (nvidia-smi) in a Docker container
if sudo docker run -it --rm --gpus all ubuntu nvidia-smi; then
    echo "Successfully ran nvidia-smi in a Docker container"
else
    echo "Failed to run nvidia-smi in a Docker container, exiting script" >&2
    exit 1
fi

echo "NVIDIA Container Toolkit installation and configuration completed successfully"