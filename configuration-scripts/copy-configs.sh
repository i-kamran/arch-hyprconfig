#!/bin/bash

##################################
### Configuration Files Setup ###
##################################

# This script copies configuration files from the main directory to the 
# appropriate locations in your home directory and .config folder. It ensures 
# that your environment is set up with the correct configurations.

# Determine the directory containing this script and the main directory
script_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
main_dir="$(dirname "$script_dir")"

# Source the functions.sh script to use print_green and print_red
# These functions provide colored output for success and error messages
source "$main_dir/install-scripts/functions.sh"

# Initialize a flag to track success or failure
success=true

# Define the source and destination paths
config_source="$main_dir/configs/.config/"
config_dest="$HOME/.config"
home_source="$main_dir/configs/home/"
home_dest="$HOME"

# Copy configuration files to the .config directory
# Using -r for recursive copying
if cp -r "$config_source"* "$config_dest"; then
    print_green "Configuration files copied to $HOME/.config successfully."
else
    print_red "Failed to copy configuration files to $HOME/.config."
    success=false
fi

# Copy configuration files to the home directory
# Using -r for recursive copying
if cp -r "$home_source." "$home_dest"; then
    print_green "Configuration files copied to $HOME successfully."
else
    print_red "Failed to copy configuration files to $HOME."
    success=false
fi

# Print a final message based on the success or failure of the operations
echo
if [ "$success" = true ]; then
    print_green "########################################"
    print_green "Configs are copied successfully."
else
    print_red "########################################"
    print_red "One or more configuration copying operations failed."
fi
