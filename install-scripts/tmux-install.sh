#!/bin/bash

######################
### Tmux Installer ###
######################

# This script installs and configures TMUX on your system.
# It will automate tmux plugin installation and theme setup.

source "$(dirname "$0")/functions.sh"

response_timer 10 "Do you want to install tmux with configs? (Y/n) " response
response=${response:-Y}
success=true
if [[ $response =~ ^[Yy]$ ]]; then
    if install_package "tmux"; then
        print_green "Tmux installed successfully."
    else
        print_red "Failed to install tmux. Continuing with script, but some features may not work."
        success=false
    fi
    # Clone the TPM repository if it doesn't already exist
    if [ ! -d "$HOME/.tmux/plugins/tpm" ]; then
      if git clone https://github.com/tmux-plugins/tpm "$HOME/.tmux/plugins/tpm"; then
        print_green "TPM repository cloned successfully."
      else
        print_red "Failed to clone TPM repository. Continuing with script, but plugin installation may fail."
            success=false
      fi
      else
        print_green "TPM repository already exists."
    fi

    # Install plugins
    echo "Installing tmux plugins. This may take a moment..."
    "$HOME/.tmux/plugins/tpm/bin/install_plugins"

    # Check if the plugin directory and theme file exist
    if [ -d "$HOME/.tmux/plugins/tmux/themes" ] && [ -f "$HOME/.config/tmux/catppuccin_mocha_tmux.conf" ]; then
        cp "$HOME/.config/tmux/catppuccin_mocha_tmux.conf" "$HOME/.tmux/plugins/tmux/themes/"
        print_green "Theme file copied successfully."
    else
        print_red "The required directories or files do not exist yet. Ensure that TPM plugins are installed properly."
        success=false
    fi

fi

echo
if $success; then
  print_green "Tmux installation script has finished successfully."
else
  print_green "########################################"
  print_green "Tmux installation script has finished."
fi

