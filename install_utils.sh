#!/bin/bash

# Source the global configuration
source "$(dirname "$0")/global_config.sh"

# Function to check if a package is installed
pkg_installed() {
    pacman -Q "$1" &>/dev/null
}

# Function to install a package
install_package() {
    local pkg="$1"
    if ! pkg_installed "$pkg"; then
        sudo pacman -S --noconfirm "$pkg"
    else
        echo "$pkg is already installed."
    fi
}

install_utilities() {
    echo "Available utilities:"
    for i in "${!UTILITIES[@]}"; do
        echo "$((i + 1)). ${UTILITIES[$i]}"
    done

    read -p "Do you want to install all utilities? (Y/n): " install_all

    if [[ $install_all =~ ^[Yy]$ | ""]]; then
        for util in "${UTILITIES[@]}"; do
            install_package "$util"
        done
    else
        for util in "${UTILITIES[@]}"; do
            read -p "Do you want to install $util? (Y/n): " choice
            if [[ $choice =~ ^[Yy]$ ]]; then
                install_package "$util"
            fi
        done
    fi
}

install_utilities

echo "Utility installation complete!"
