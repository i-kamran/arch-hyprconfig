#!/bin/bash

# Source the global configuration
source "$(dirname "$0")/global_config.sh"
source "$(dirname "$0")/global_functions.sh"

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

    read -p "Do you want to install all packages? (Y/n): " install_all
    install_all=${install_all:-Y}

    if [[ $install_all =~ ^[Yy]$ ]]; then
        for pkg in "${AUR_PACKAGES[@]}"; do
          install_aur_package $pkg $selected_helper
        done
    else
      for pkg in "${AUR_PACKAGES[@]}"; do
        read -p "Do you want to install $pkg? (Y/n): " choice
        choice=${choice:-Y}
        if [[ $choice =~ ^[Yy]$ ]]; then
          install_aur_package $pkg $selected_helper
        fi
      done
    fi
}
# Main script execution
install_aur_packages

echo
print_green "########################################"
print_green "Aur packages installation complete!"