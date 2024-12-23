#!/bin/bash

###############################
### AUR Helper Installation ###
###############################

# This script helps you install an AUR helper on Arch Linux.
# Choose from a list of available helpers, and the script will
# handle cloning, building, and installing it for you.
# If the helper is already installed, it'll let you know and skip the installation.

# Source the global configuration
source "$(dirname "$0")/packages.sh"
source "$(dirname "$0")/functions.sh"


install_aur_helper() {
    local aurhlpr="$1"
    local cloneDir="$HOME/Clone"

    # Create Clone directory if it doesn't exist
    if [ ! -d "$cloneDir" ]; then
        mkdir "$cloneDir"
        echo "$HOME/Clone directory created..."
    else
        rm -rf "${cloneDir/}${aurhlpr}"
    fi

    # Clone and build the AUR helper
    git clone "https://aur.archlinux.org/${aurhlpr}.git" "$cloneDir/${aurhlpr}"
    cd "$cloneDir/${aurhlpr}" || { echo "Failed to change directory"; exit 1; }

    # Check the result of the makepkg command
    if makepkg -si --noconfirm; then
        print_green "${aurhlpr} AUR helper installed..."
        echo "$aurhlpr" > /tmp/selected_aur_helper
    else
        echo "${aurhlpr} installation failed..."
    fi

    # Cleanup
    cd
    rm -rf "$cloneDir"
}

prompt_user_selection() {
    # Display available AUR helpers
    echo "Available AUR helpers:"
    for i in "${!AUR_HELPERS[@]}"; do
        echo "$((i + 1)). ${AUR_HELPERS[$i]}"
    done

    # Prompt user for selection
    response_timer 10 "Enter the number of the AUR helper to install (Default=1): " response
    response=${response:-1}

    # Validate the response
    if [[ "$response" -ge 1 && "$response" -le "${#AUR_HELPERS[@]}" ]]; then
        selected_helper="${AUR_HELPERS[$((response - 1))]}"
        if ! command -v "$selected_helper" &>/dev/null; then
            install_aur_helper "$selected_helper"
        else
            print_green "$selected_helper is already installed."
            echo "$selected_helper" > /tmp/selected_aur_helper
        fi
    else
        print_red "Invalid choice. Exiting."
    fi
}

# Main script execution
prompt_user_selection

echo
print_green "########################################"
print_green "AUR helper installation complete!"
