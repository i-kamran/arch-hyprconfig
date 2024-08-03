#!/bin/bash

# Source the global configuration
source "$(dirname "$0")/global_config.sh"
source "$(dirname "$0")/global_functions.sh"


# Installing git if not installed
if ! pkg_installed "git"; then
  install_package "git"
else 
  print_green "Git is already installed."
fi

# Install zsh
./install_zsh.sh

# Install utilities
echo
echo "Installing pacman packages..."
./install_pkgs.sh

# Install AUR helper
echo
echo "Installing AUR helper..."
./install_aur_helper.sh

# Install AUR utilities
echo
echo "Installing AUR utilities..."
./install_aur_utils.sh

# Copy wallpaper to .config
cp -r "$(dirname "$0")/wallpapers" ~/.config
# Copy rofi theme into /usr/share
cp -r "$(dirname "$0")/themes"

# Stow config
echo
echo "Applying configurations with stow..."

stow -d "$(dirname "$0")/configs" --adopt -t ~/.config . 


print_green "Configuration applied with stow."



echo "Enabling services."
systemctl --user enable pipewire.service
systemctl --user start pipewire.service
systemctl --user start wireplumber
sudo systemctl enable bluetooth.service
sudo systemctl start bluetooth.service
sudo systemctl enable sddm.service

echo
echo
print_green "#############################"
print_green "### INSTALATION COMPLETE! ###"
print_green "#############################"