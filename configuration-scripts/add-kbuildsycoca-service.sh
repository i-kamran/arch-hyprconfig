#!/bin/bash

#############################
### Systemd Service Setup ###
#############################

# This script sets up a systemd user service to ensure Dolphin has the correct 
# default apps in Hyprland. It creates the necessary service file, reloads the 
# systemd daemon, and enables the service to start on login.
# This ensures that the service is always active in your environment.

# Source the functions.sh script to use print_green and print_red
# These functions provide colored output for success and error messages
script_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
main_dir="$(dirname "$script_dir")"
source "$main_dir/install-scripts/functions.sh"

# Define the path to the systemd service file
SERVICE_FILE="$HOME/.config/systemd/user/kbuildsycoca.service"

# Create the systemd service file
# The service file ensures Dolphin has the correct default apps on Hyprland
echo "
[Unit]
Description=Ensure Dolphin has the correct default apps on Hyprland

[Service]
ExecStart=/usr/bin/env XDG_MENU_PREFIX=arch- kbuildsycoca6
Restart=on-failure

[Install]
WantedBy=default.target
" > "$SERVICE_FILE"

# Check if the service file was created successfully
if [ -f "$SERVICE_FILE" ]; then
    print_green "Systemd service file created successfully at $SERVICE_FILE."
else
    print_red "Failed to create the systemd service file."
fi

# Reload the systemd user daemon to recognize the new service file
if systemctl --user daemon-reload; then
    print_green "Systemd user daemon reloaded successfully."
else
    print_red "Failed to reload the systemd user daemon."
fi

# Enable the service to start on login
if systemctl --user enable kbuildsycoca.service; then
    print_green "Systemd service 'kbuildsycoca' enabled successfully."
else
    print_red "Failed to enable the systemd service 'kbuildsycoca'."
fi
