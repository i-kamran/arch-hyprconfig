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

# Stow config
echo
echo "Applying configurations with stow..."

script_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

stow -d "$script_dir/configs" --adopt -t ~/.config . 
echo "$script_dir/configs"

print_green "Configuration applied with stow."

echo "Enabling services."
systemctl --user enable pipewire.service
systemctl --user start pipewire.service
systemctl --user start wireplumber
sudo systemctl enable bluetooth.service
sudo systemctl start bluetooth.service
sudo systemctl enable sddm.service

echo
print_green "########################################"
print_green "Services are enabled"

# Apply themes
echo "Applying themes"
kvantummanager --set LayanDark
papirus-folders --theme Papirus-Dark -C cat-mocha-teal

# GPU
echo "Installing Intel Graphics"
./install_intell_gpu.sh

# Install zsh
./install_zsh.sh

echo
echo
print_green "#############################"
print_green "### INSTALLATION COMPLETE! ###"
print_green "#############################"
