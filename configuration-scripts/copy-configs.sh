#!/bin/bash

##################################
### Configuration Files Setup ###
##################################

# This script copies configuration files from the main directory to the 
# appropriate locations in your home directory and .config folder. It ensures 
# that your environment is set up with the correct configurations.

script_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
main_dir="$(dirname "$script_dir")"
source "$main_dir/install-scripts/functions.sh"

# Copy to .config
cp -r "$main_dir/configs/.config/"* "$HOME/.config" 

# Copy to home directory
cp -r "$main_dir/configs/home/." "$HOME"

echo
print_green "########################################"
print_green "Configs are copied"