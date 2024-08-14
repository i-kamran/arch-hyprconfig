#!/bin/bash

############################
### Package Installation ###
############################

# This script helps you install a list of packages.
# You can choose to install all packages at once or select
# individual packages for installation. It uses the global
# configuration from the specified files for package details.

# Source the global configuration
source "$(dirname "$0")/packages.sh"
source "$(dirname "$0")/functions.sh"

install_packages() {
    echo "Available packages:"
    for i in "${!PACKAGES[@]}"; do
        echo "$((i + 1)). ${PACKAGES[$i]}"
    done

    read -p "Do you want to install all packages? (Y/n): " install_all
    install_all=${install_all:-Y}

    if [[ $install_all =~ ^[Yy]$ ]]; then
        for pkg in "${PACKAGES[@]}"; do
            install_package "$pkg"
        done
    else
        for pkg in "${PACKAGES[@]}"; do
            read -p "Do you want to install $pkg? (Y/n): " choice
            choice=${choice:-Y}
            if [[ $choice =~ ^[Yy]$ ]]; then
                install_package "$pkg"
            fi
        done
    fi
}

install_packages
echo
print_green "########################################"
print_green "Pacman packages installation complete!"
