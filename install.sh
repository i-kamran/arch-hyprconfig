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
        if [[ "$pkg" == "visual-studio-code-bin" ]]; then
            $AUR_HELPER -S --noconfirm "$pkg"
        else
            sudo pacman -S --noconfirm "$pkg"
        fi
    else
        echo "$pkg is already installed."
    fi
}

# Install utilities
echo "Installing utilities..."
./install_utils.sh

# Install AUR helper
echo "Installing AUR helper..."
./install_aur_helper.sh

# Install editors
install_editors() {
    echo "Available editors:"
    for i in "${!EDITORS[@]}"; do
        echo "$((i + 1)). ${EDITORS[$i]}"
    done

    read -p "Do you want to install all editors? (y/n): " install_all

    if [[ $install_all =~ ^[Yy]$ ]]; then
        for editor in "${EDITORS[@]}"; do
            install_package "$editor"
        done
    else
        for editor in "${EDITORS[@]}"; do
            read -p "Do you want to install $editor? (y/n): " choice
            if [[ $choice =~ ^[Yy]$ ]]; then
                install_package "$editor"
            fi
        done
    fi
}

# Get the selected AUR helper
AUR_HELPER=$(cat /tmp/selected_aur_helper)

echo "Installing editors..."
install_editors

echo "Installation complete!"
