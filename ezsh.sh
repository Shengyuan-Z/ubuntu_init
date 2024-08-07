#!/bin/bash

set -e  # Exit immediately if a command exits with a non-zero status

# Clone the ezsh repository
if git clone https://github.com/jotyGill/ezsh; then
    echo "Successfully cloned the ezsh repository"
else
    echo "Failed to clone the ezsh repository, exiting script" >&2
    exit 1
fi

# Change to the ezsh directory
if cd ezsh; then
    echo "Successfully changed to the ezsh directory"
else
    echo "Failed to change to the ezsh directory, exiting script" >&2
    exit 1
fi

# Run the ezsh installation script with the '-c' option
if ./install.sh -c; then
    echo "Successfully ran the ezsh installation script"
else
    echo "Failed to run the ezsh installation script, exiting script" >&2
    exit 1
fi

# Change back to the parent directory
if cd ..; then
    echo "Successfully changed back to the parent directory"
else
    echo "Failed to change back to the parent directory, exiting script" >&2
    exit 1
fi

# Remove the cloned ezsh repository
if rm -rf ezsh; then
    echo "Successfully removed the cloned ezsh repository"
else
    echo "Failed to remove the cloned ezsh repository, exiting script" >&2
    exit 1
fi

# Enable zsh-autosuggestions in the ezsh configuration file
if sed -i 's/# zsh-autosuggestions/zsh-autosuggestions/' ~/.config/ezsh/ezshrc.zsh && source ~/.config/ezsh/ezshrc.zsh; then
    echo "Successfully enabled zsh-autosuggestions in the ezsh configuration file"
    # reload conf
    if source ~/.config/ezsh/ezshrc.zsh > /dev/null 2>&1; then
        echo "Configuration reloaded successfully"
    else
        echo "Warning: Failed to reload configuration. Please restart your shell" >&2
    fi
else
    echo "Failed to enable zsh-autosuggestions in the ezsh configuration file, exiting script" >&2
    exit 1
fi


echo "ezsh installation and configuration completed successfully"