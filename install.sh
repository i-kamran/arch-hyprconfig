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

# Configs and Services
echo
echo "Copying configs"

script_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cp -r "$script_dir/configs/"* "$HOME/.config"

echo "Enabling services."

./services_and_themes.sh

echo
print_green "########################################"
print_green "Services are enabled"

./mount.sh

# Install zsh
./install_zsh.sh

echo
echo
print_green "#############################"
print_green "### INSTALLATION COMPLETE! ###"
print_green "#############################"
