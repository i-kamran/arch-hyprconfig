#!/bin/bash

source "$(dirname "$0")/global_functions.sh"

# Prompt the user with a default option of 'Y'
read -p "Do you want to install oh-my-zsh? (Y/n): " install_choice
install_choice=${install_choice:-Y}


# Install zsh if not installed
shell="zsh"
if ! pkg_installed $shell; then
    install_package $shell
    echo "zsh installed."
else
    echo "zsh is already installed."
fi

# Install oh-my-zsh if user chose 'Y' or pressed Enter
if [[ "$install_choice" =~ ^[Yy]$ ]]; then
    echo "Installing oh-my-zsh..."
    sudo pacman -S --noconfirm $shell
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
    echo "oh-my-zsh installed."
else
    echo "Skipping oh-my-zsh installation."
fi


echo
print_green "########################################"
print_green "Zsh installation complete!"