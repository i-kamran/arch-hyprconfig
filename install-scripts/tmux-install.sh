#!/bin/bash

######################
### Tmux Installer ###
######################

# This script installs and configures TMUX on your system.
# It will automate tmux plugin installation and theme setup.

source "$(dirname "$0")/functions.sh"

read -p "Do you want to install tmux with configs? (Y/n) " install_choice
install_choice=${install_choice:-Y}

if [[ $install_choice =~ ^[Yy]$ ]]; then
    # Install tmux
    install_package "tmux"
   
    # Clone the TPM repository if it doesn't already exist
    if [ ! -d "$HOME/.tmux/plugins/tpm" ]; then
        git clone https://github.com/tmux-plugins/tpm "$HOME/.tmux/plugins/tpm"
    fi

    # Install plugins
    echo "Installing tmux plugins. This may take a moment..."
    "$HOME/.tmux/plugins/tpm/bin/install_plugins"

    # Check if the plugin directory and theme file exist
    if [ -d "$HOME/.tmux/plugins/tmux/themes" ] && [ -f "$HOME/.config/tmux/mocha.tmuxtheme" ]; then
        # Copy the theme file if it exists
        cp "$HOME/.config/tmux/mocha.tmuxtheme" "$HOME/.tmux/plugins/tmux/themes/catppuccin_mocha.tmuxtheme"
        echo "Theme file copied successfully."
    else
        echo "The required directories or files do not exist yet. Ensure that TPM plugins are installed properly."
    fi

fi

echo
print_green "########################################"
print_green "Tmux installation script has finished."

