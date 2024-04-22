#!/bin/bash

set -e  # Exit immediately if a command exits with a non-zero status

# Download the CUDA keyring package
if ! wget https://developer.download.nvidia.com/compute/cuda/repos/ubuntu2204/x86_64/cuda-keyring_1.1-1_all.deb; then
   echo "Failed to download the CUDA keyring package, exiting script" >&2
   exit 1
fi

# Install the CUDA keyring package
if ! sudo dpkg -i cuda-keyring_1.1-1_all.deb; then
   echo "Failed to install the CUDA keyring package, exiting script" >&2
   exit 1
fi

# Clean up the downloaded package file
if ! rm cuda-keyring_1.1-1_all.deb; then
   echo "Failed to remove the downloaded CUDA keyring package file, exiting script" >&2
   exit 1
fi

# Update the package lists
if ! sudo apt-get update; then
   echo "Failed to update the package lists, exiting script" >&2
   exit 1
fi

# Install CUDA Toolkit 12.4
if ! sudo apt-get -y install cuda-toolkit-12-4; then
   echo "Failed to install CUDA Toolkit 12.4, exiting script" >&2
   exit 1
fi

echo "CUDA Toolkit 12.4 installation completed successfully"