#!/bin/bash

set -e  # Exit immediately if a command exits with a non-zero status

# Install wget and gpg
if sudo apt-get install wget gpg -y; then
    echo "Successfully installed wget and gpg"
else
    echo "Failed to install wget and gpg, exiting script" >&2
    exit 1
fi

# Download and install the Microsoft GPG key
if wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg; then
    echo "Successfully downloaded and installed the Microsoft GPG key"
else
    echo "Failed to download and install the Microsoft GPG key, exiting script" >&2
    exit 1
fi

# Install the Microsoft GPG key package
if sudo install -D -o root -g root -m 644 packages.microsoft.gpg /etc/apt/keyrings/packages.microsoft.gpg; then
    echo "Successfully installed the Microsoft GPG key package"
else
    echo "Failed to install the Microsoft GPG key package, exiting script" >&2
    exit 1
fi

# Add the Visual Studio Code repository to the sources list
if sudo sh -c 'echo "deb [arch=amd64,arm64,armhf signed-by=/etc/apt/keyrings/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main" > /etc/apt/sources.list.d/vscode.list'; then
    echo "Successfully added the Visual Studio Code repository to the sources list"
else
    echo "Failed to add the Visual Studio Code repository to the sources list, exiting script" >&2
    exit 1
fi

# Remove the downloaded Microsoft GPG key file
if rm -f packages.microsoft.gpg; then
    echo "Successfully removed the downloaded Microsoft GPG key file"
else
    echo "Failed to remove the downloaded Microsoft GPG key file, exiting script" >&2
    exit 1
fi

# Install apt-transport-https
if sudo apt install apt-transport-https; then
    echo "Successfully installed apt-transport-https"
else
    echo "Failed to install apt-transport-https, exiting script" >&2
    exit 1
fi

# Update package lists
if sudo apt update; then
    echo "Successfully updated package lists"
else
    echo "Failed to update package lists, exiting script" >&2
    exit 1
fi

# Install Visual Studio Code
if sudo apt install code -y; then
    echo "Successfully installed Visual Studio Code"
else
    echo "Failed to install Visual Studio Code, exiting script" >&2
    exit 1
fi

# Print the version of Visual Studio Code
if code -v; then
    echo "Successfully printed the version of Visual Studio Code"
else
    echo "Failed to print the version of Visual Studio Code, exiting script" >&2
    exit 1
fi

echo "Installation of Visual Studio Code completed successfully"