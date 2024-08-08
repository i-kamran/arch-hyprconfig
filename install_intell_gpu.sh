#!/bin/bash

# Source global functions
source "$(dirname "$0")/global_functions.sh"

# Define the packages needed for Intel GPU
GPU_PKG=("xf86-video-intel" "vulkan-intel" "libva-intel-driver" "intel-media-driver")

# Install each package
for pkg in "${GPU_PKG[@]}"; do
    install_package "$pkg"
done

# Create a dummy X11 configuration file in case X11 use
X11_CONFIG_PATH="/etc/X11/xorg.conf.d/20-intel.conf"
config='
Section "Device"
    Identifier  "Intel Graphics"
    Driver      "intel"
    Option      "TearFree" "true"
EndSection
'

# Write the X11 configuration if the directory exists
if [ -d "/etc/X11/xorg.conf.d" ]; then
    echo "$config" | sudo tee "$X11_CONFIG_PATH"
fi

echo "Intel GPU setup completed."
