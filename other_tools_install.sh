#!/bin/bash

set -e  # Exit immediately if a command exits with a non-zero status

# Install VLC using Snap
if sudo snap install vlc; then
    echo "Successfully installed VLC using Snap"
else
    echo "Failed to install VLC using Snap, exiting script" >&2
    exit 1
fi

# Download and install Google Chrome
if wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb; then
    echo "Successfully downloaded Google Chrome"
else
    echo "Failed to download Google Chrome, exiting script" >&2
    exit 1
fi

if sudo apt install ./google-chrome-stable_current_amd64.deb -y; then
    echo "Successfully installed Google Chrome"
else
    echo "Failed to install Google Chrome, exiting script" >&2
    exit 1
fi

if rm ./google-chrome-stable_current_amd64.deb; then
    echo "Successfully removed the Google Chrome deb file"
else
    echo "Failed to remove the Google Chrome deb file, exiting script" >&2
    exit 1
fi

# Add Sublime Text repository and install Sublime Text
if wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | gpg --dearmor | sudo tee /etc/apt/trusted.gpg.d/sublimehq-archive.gpg > /dev/null; then
    echo "Successfully added Sublime Text GPG key"
else
    echo "Failed to add Sublime Text GPG key, exiting script" >&2
    exit 1
fi

if echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list; then
    echo "Successfully added Sublime Text repository"
else
    echo "Failed to add Sublime Text repository, exiting script" >&2
    exit 1
fi

if sudo apt-get update; then
    echo "Successfully updated package lists"
else
    echo "Failed to update package lists, exiting script" >&2
    exit 1
fi

if sudo apt-get install apt-transport-https -y; then
    echo "Successfully installed apt-transport-https"
else
    echo "Failed to install apt-transport-https, exiting script" >&2
    exit 1
fi

if sudo apt-get install sublime-text -y; then
    echo "Successfully installed Sublime Text"
else
    echo "Failed to install Sublime Text, exiting script" >&2
    exit 1
fi

# Download and install ToDesk
if wget https://dl.todesk.com/linux/todesk-v4.7.2.0-amd64.deb; then
    echo "Successfully downloaded ToDesk"
else
    echo "Failed to download ToDesk, exiting script" >&2
    exit 1
fi

if sudo dpkg -i todesk-v4.7.2.0-amd64.deb; then
    echo "Successfully installed ToDesk"
else
    echo "Failed to install ToDesk, exiting script" >&2
    exit 1
fi

if rm todesk-v4.7.2.0-amd64.deb; then
    echo "Successfully removed the ToDesk deb file"
else
    echo "Failed to remove the ToDesk deb file, exiting script" >&2
    exit 1
fi

echo "Installation of VLC, Google Chrome, Sublime Text, and ToDesk completed successfully"