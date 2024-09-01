#!/bin/bash

##############################
### NPM Packages Installer ###
##############################

# This script installs and npm packages.
source "$(dirname "$0")/functions.sh"

NPM_PACKAGES=(
"eslint_d"              # JS static analysis tool
"async"                 # Module to work with async JS
)

read -p "Do you want to install npm packages? (Y/n) " install_choice
install_choice=${install_choice:-Y}


if [[ $install_choice =~ ^[Yy] ]] && pkg_installed "npm"; then
    for pkg in "${NPM_PACKAGES[@]}"; do
      npm install -g "$pkg"
    done
else
    echo "Installation skipped or npm is not installed."
fi

echo
print_green "########################################"
print_green "NPM packages installation complete!"

