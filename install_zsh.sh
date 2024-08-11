#!/bin/bash

source "$(dirname "$0")/global_functions.sh"

# Prompt the user with a default option of 'Y'
read -p "Do you want to install oh-my-zsh? (Y/n): " install_choice
install_choice=${install_choice:-Y}


# Install oh-my-zsh if user chose 'Y' or pressed Enter
if [[ "$install_choice" =~ ^[Yy]$ ]]; then
    # Install zsh if not installed
    shell="zsh"
    if ! pkg_installed $shell; then
        install_package $shell
        echo "zsh installed."
    else
        echo "zsh is already installed."
    fi
    echo "Installing oh-my-zsh..."
    sudo pacman -S --noconfirm $shell
    sh -c "$(wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended || true
    echo "oh-my-zsh installed."
    # Configs
    script_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
    cp $script_dir/zshrc/.zshrc" "$HOME"
    echo "Installing plugings."
    git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
    chsh -s $(which zsh)
    echo
    print_green "########################################"
    print_green "Zsh installation complete!"
else
    echo "Skipping oh-my-zsh installation."
fi

