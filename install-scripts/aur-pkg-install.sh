#!/bin/bash

##############################
### AUR Packages Installer ###
##############################

# This script installs packages from the AUR using a selected AUR helper.
# It will prompt you to choose whether to install all available packages
# or select individual ones

# Source the global configuration
source "$(dirname "$0")/packages.sh"
source "$(dirname "$0")/functions.sh"

# Ensure the AUR helper selection exists
if [ ! -f /tmp/selected_aur_helper ]; then
    echo "No AUR helper selected. Run install_aur_helper.sh first."
    exit 1
fi

# Read the selected AUR helper
selected_helper=$(cat /tmp/selected_aur_helper)

# Function to install packages with AUR helper
install_aur_packages() {
    echo "Installing utilities with $selected_helper..."
    echo "Available AUR packages:"
    for i in "${!AUR_PACKAGES[@]}"; do
        echo "$((i + 1)). ${AUR_PACKAGES[$i]}"
    done

    response_timer 10 "Do you want to install all packages? (Y/n): " response
    response=${response:-Y}

    if [[ $response =~ ^[Yy]$ ]]; then
        for pkg in "${AUR_PACKAGES[@]}"; do
          install_aur_package "$pkg" "$selected_helper"
        done
    else
      for pkg in "${AUR_PACKAGES[@]}"; do
        response_timer 10 "Do you want to install $pkg? (Y/n): " response
        response=${response:-Y}
        if [[ $response =~ ^[Yy]$ ]]; then
          install_aur_package "$pkg" "$selected_helper"
        fi
      done
    fi
}
# Main script execution
install_aur_packages

echo
print_green "########################################"
print_green "AUR packages installation complete!"