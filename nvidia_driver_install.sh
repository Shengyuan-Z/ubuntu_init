#!/bin/bash

# set -e  # Exit immediately if a command exits with a non-zero status


# Check if an NVIDIA driver is currently installed and properly functioning
nvidia_smi_output=$(nvidia-smi 2>&1)
if echo "$nvidia_smi_output" | grep -q "NVIDIA-SMI has failed because it couldn't communicate with the NVIDIA driver"; then
    echo "The installed NVIDIA driver is not functioning properly. The script will now attempt to uninstall potentially problematic drivers and install a new driver."
    echo "nvidia-smi output: $nvidia_smi_output"

    echo "Uninstalling potentially problematic NVIDIA drivers..."
    sudo apt-get remove --purge nvidia*
    sudo apt autoremove
    echo "Potentially problematic NVIDIA drivers uninstalled. Proceeding to driver installation."
else
    echo "An NVIDIA driver may be currently installed and properly functioning."

    while true; do
        read -p "Do you want to uninstall the current driver and install a new one? (y/n): " yn
        case $yn in
            [Yy]* ) 
                echo "Uninstalling the current NVIDIA driver..."
                sudo apt-get remove --purge nvidia*
                sudo apt autoremove
                echo "NVIDIA driver uninstalled successfully."
                break
                ;;
            [Nn]* ) 
                echo "Keeping the current driver. Exiting script."
                exit
                ;;
            * ) echo "Please answer yes or no.";;
        esac
    done
fi

# List available GPGPU drivers
if ! sudo ubuntu-drivers list --gpgpu; then
    echo "Failed to list available GPGPU drivers, exiting script" >&2
    exit 1
fi

# Prompt the user to enter the desired driver or press Enter for the default best driver
echo "\nPlease enter the desired driver (e.g., nvidia-driver-530) or press Enter to use the default best driver:"
read driver

if [ -z "$driver" ]; then
    echo "No driver specified, using the default best driver"
    if ! sudo ubuntu-drivers autoinstall; then
        echo "Failed to install the default best driver, exiting script" >&2
        exit 1
    fi
else
    echo "Using the specified driver: $driver"
    if ! sudo ubuntu-drivers install "$driver"; then
        echo "Failed to install the driver $driver, the driver may not be available" >&2
        echo "Please check the available drivers with 'sudo ubuntu-drivers list --gpgpu' and try again"
        exit 1
    fi
fi

echo "GPGPU driver installation completed successfully"


# Run nvidia-smi to display GPU information
if ! nvidia-smi; then
    echo "Failed to run nvidia-smi, please check if the NVIDIA driver is properly installed" >&2
    exit 1
fi
