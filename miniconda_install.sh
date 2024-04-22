#!/bin/bash

set -e  # Exit immediately if a command exits with a non-zero status

# Create the directory for Miniconda installation
if mkdir -p ~/miniconda3; then
    echo "Successfully created the directory for Miniconda installation"
else
    echo "Failed to create the directory for Miniconda installation, exiting script" >&2
    exit 1
fi

# Download the Miniconda installation script
if wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -O ~/miniconda3/miniconda.sh; then
    echo "Successfully downloaded the Miniconda installation script"
else
    echo "Failed to download the Miniconda installation script, exiting script" >&2
    exit 1
fi

# Run the Miniconda installation script
if bash ~/miniconda3/miniconda.sh -b -u -p ~/miniconda3; then
    echo "Successfully ran the Miniconda installation script"
else
    echo "Failed to run the Miniconda installation script, exiting script" >&2
    exit 1
fi

# Remove the Miniconda installation script
if rm -rf ~/miniconda3/miniconda.sh; then
    echo "Successfully removed the Miniconda installation script"
else
    echo "Failed to remove the Miniconda installation script, exiting script" >&2
    exit 1
fi

# Initialize Conda for Bash
if ~/miniconda3/bin/conda init bash; then
    echo "Successfully initialized Conda for Bash"
else
    echo "Failed to initialize Conda for Bash, exiting script" >&2
    exit 1
fi

# Initialize Conda for Zsh
if ~/miniconda3/bin/conda init zsh; then
    echo "Successfully initialized Conda for Zsh"
else
    echo "Failed to initialize Conda for Zsh, exiting script" >&2
    exit 1
fi

echo "Miniconda installation and initialization completed successfully"