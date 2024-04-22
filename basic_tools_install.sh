#!/bin/bash

set -e  # Exit immediately if a command exits with a non-zero status

# Update package lists
if sudo apt update; then
    echo "Successfully updated package lists"
else
    echo "Failed to update package lists, exiting script" >&2
    exit 1
fi

# Install zsh git curl wget vim htop build-essential g++ cmake make unzip python3.10 ffmpeg pigz ccache
if sudo apt install -y zsh git curl wget vim htop build-essential g++ cmake make unzip python3.10 ffmpeg pigz ccache; then
    echo "Successfully installed zsh git curl wget vim htop build-essential g++ cmake make unzip python3.10 ffmpeg pigz ccache"
else
    echo "Failed to install zsh git curl wget vim htop build-essential g++ cmake make unzip python3.10 ffmpeg pigz ccache, exiting script" >&2
    exit 1
fi

# Download OpenCV
if wget -O opencv.zip https://github.com/opencv/opencv/archive/master.zip; then
    echo "Successfully downloaded OpenCV"
else
    echo "Failed to download OpenCV, exiting script" >&2
    exit 1
fi

# Extract OpenCV
if unzip -q -o opencv.zip; then
    echo "Successfully extracted OpenCV"
else
    echo "Failed to extract OpenCV, exiting script" >&2
    exit 1
fi


# Rename OpenCV directory and remove the zip file
if mv opencv-master opencv && rm opencv.zip; then
    echo "Successfully renamed OpenCV directory and removed the zip file"
else
    echo "Failed to rename OpenCV directory or remove the zip file, exiting script" >&2
    exit 1
fi

# Create build directory and configure CMake
if mkdir -p build && cd build && cmake -DCMAKE_BUILD_TYPE=Release \
                                         -DBUILD_DOCS=OFF \
                                         -DBUILD_PERF_TESTS=OFF \
                                         -DBUILD_TESTS=OFF \
                                         -DWITH_TBB=ON \
                                         -DCMAKE_CXX_COMPILER_LAUNCHER=ccache \
                                         ../opencv; then
    echo "Successfully created build directory and configured CMake"
else
    echo "Failed to create build directory or configure CMake, exiting script" >&2
    exit 1
fi

# Build and install OpenCV
if make -j$(nproc --all) -l$(nproc --all) && make install; then
    echo "Successfully built and installed OpenCV"
else
    echo "Failed to build or install OpenCV, exiting script" >&2
    exit 1
fi

# Clean up
if cd .. && rm -rf build opencv; then
    echo "Successfully cleaned up"
else
    echo "Failed to clean up, exiting script" >&2
    exit 1
fi

echo "OpenCV installation completed successfully"