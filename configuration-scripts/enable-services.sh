#!/bin/bash

################################
### System Services Enabler  ###
################################

# This script enables essential system services, including Pipewire, Bluetooth, 
# and LY. It also changes power key behavior to suspend and adjusts related settings.

# Determine the directory containing this script and the main directory
script_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
main_dir="$(dirname "$script_dir")"

# Source the functions.sh script to use print_green and print_red
# These functions provide colored output for success and error messages
source "$main_dir/install-scripts/functions.sh"

# Initialize a flag to track success or failure
success=true

# Enable Pipewire service for the user
if systemctl --user enable pipewire.service; then
    print_green "Pipewire service enabled successfully."
else
    print_red "Failed to enable Pipewire service."
    success=false
fi

# Enable Bluetooth service system-wide
if sudo systemctl enable bluetooth.service; then
    print_green "Bluetooth service enabled successfully."
else
    print_red "Failed to enable Bluetooth service."
    success=false
fi

# Enable ly service system-wide
if sudo systemctl enable ly.service; then
    print_green "LY service enabled successfully."
else
    print_red "Failed to enable LY service."
    success=false
fi

# Change power key behavior to suspend
if sudo sed -i -e "s/^#HandlePowerKey=poweroff/HandlePowerKey=suspend/" \
    -e 's/^#HandlePowerKeyLongPress=ignore/HandlePowerKeyLongPress=poweroff/' \
    -e 's/^#HandleLidSwitch=/HandleLidSwitch=/' /etc/systemd/logind.conf; then
    print_green "Power key behavior updated successfully."
else
    print_red "Failed to update power key behavior."
    success=false
fi

# Print a final message based on the success or failure of the operations
echo
if [ "$success" = true ]; then
    print_green "########################################"
    print_green "All services and configurations are applied successfully."
else
    print_red "########################################"
    print_red "One or more service enabling or configuration updates failed."
fi
