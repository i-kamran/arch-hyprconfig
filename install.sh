#!/bin/bash

# Source the global configuration
source "$(dirname "$0")/install-scripts/packages.sh"
source "$(dirname "$0")/install-scripts/functions.sh"

script_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
install_scripts_dir="$script_dir/install-scripts"
config_scripts_dir="$script_dir/configuration-scripts"


# Installing git if not installed
if ! pkg_installed "git"; then
  install_package "git"
else 
  print_green "Git is already installed."
fi

# Install utilities
echo
echo "Installing pacman packages..."
make_exec_and_run "$install_scripts_dir/pacman-pkg-install.sh"


# Install AUR helper
echo
echo "Installing AUR helper..."
make_exec_and_run "$install_scripts_dir/aur-helper-install.sh"

# Install AUR packages
echo
echo "Installing AUR packages..."
make_exec_and_run "$install_scripts_dir/aur-pkg-install.sh"

# Install zsh
echo
echo "Installing zsh and oh-my-zsh packages..."
./install_zsh.sh
make_exec_and_run "$install_scripts_dir/zsh-install.sh"

# Enable Services
echo
echo "Enabling services."
make_exec_and_run "$config_scripts_dir/enable-services.sh"

# Polkit Udisks2
echo
echo "Adding polkit rule to mount disks."
make_exec_and_run "$config_scripts_dir/polkit-udisks2.sh"

# Copy configs 
echo
echo "Copying configs"
make_exec_and_run "$config_scripts_dir/copy-configs.sh"

# Apply themes 
echo
echo "Copying configs"
make_exec_and_run "$config_scripts_dir/apply-themes.sh"

# Create symlinks with stow
echo
echo "Copying configs"
make_exec_and_run "$config_scripts_dir/stow.sh"

# Copy utility-scripts 
echo
echo "Copying configs"
make_exec_and_run "$config_scripts_dir/copy-util-scripts.sh"




 #"add_personal_dict_aspell.sh" "$script_dir/configs"

echo
echo
print_green "##############################"
print_green "### INSTALLATION COMPLETE! ###"
print_green "##############################"
