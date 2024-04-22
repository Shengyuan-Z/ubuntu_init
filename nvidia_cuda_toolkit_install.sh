#!/bin/bash

set -e  # Exit immediately if a command exits with a non-zero status

# Add the NVIDIA Container Toolkit GPG key
if ! curl -fsSL https://nvidia.github.io/libnvidia-container/gpgkey | sudo gpg --dearmor -o /usr/share/keyrings/nvidia-container-toolkit-keyring.gpg; then
    echo "Failed to add the NVIDIA Container Toolkit GPG key, exiting script" >&2
    exit 1
fi

# Add the NVIDIA Container Toolkit repository to the sources list
if ! curl -s -L https://nvidia.github.io/libnvidia-container/stable/deb/nvidia-container-toolkit.list | \
    sed 's#deb https://#deb [signed-by=/usr/share/keyrings/nvidia-container-toolkit-keyring.gpg] https://#g' | \
    sudo tee /etc/apt/sources.list.d/nvidia-container-toolkit.list; then
    echo "Failed to add the NVIDIA Container Toolkit repository to the sources list, exiting script" >&2
    exit 1
fi

# Uncomment the experimental line in the NVIDIA Container Toolkit sources list
if ! sudo sed -i -e '/experimental/ s/^#//g' /etc/apt/sources.list.d/nvidia-container-toolkit.list; then
    echo "Failed to uncomment the experimental line in the NVIDIA Container Toolkit sources list, exiting script" >&2
    exit 1
fi

# Update the package lists
if ! sudo apt-get update; then
    echo "Failed to update the package lists, exiting script" >&2
    exit 1
fi

# Install the NVIDIA Container Toolkit
if ! sudo apt-get install -y nvidia-container-toolkit; then
    echo "Failed to install the NVIDIA Container Toolkit, exiting script" >&2
    exit 1
fi

echo "NVIDIA Container Toolkit installation completed successfully"