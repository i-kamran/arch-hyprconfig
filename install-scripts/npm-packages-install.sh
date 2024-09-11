#!/bin/bash

##############################
### NPM Packages Installer ###
##############################

# This script installs npm packages.
source "$(dirname "$0")/functions.sh"

NPM_PACKAGES=(
"eslint_d"              # JS static analysis tool
"async"                 # Module to work with async JS
"lodash"
)

response_timer 10 "Do you want to install npm packages? (Y/n) " response
response=${response:-Y}
success=true
# Function to install npm packages
install_npm_packages() {
    for pkg in "${NPM_PACKAGES[@]}"; do
        if ! sudo npm install -g "$pkg"; then
            print_red "Failed to install $pkg."
            success=false
        else
            print_green "Successfully installed $pkg."
        fi
    done

}

# Check if npm is installed and if user wants to proceed
if [[ $response =~ ^[Yy] ]] && pkg_installed "npm"; then
    if $success; then
        print_green "########################################"
        print_green "NPM packages installation complete!"
    else
        print_red "########################################"
        print_red "NPM packages installation encountered errors."
    fi
else
    print_red "Installation skipped or npm is not installed."
fi
