#!/bin/bash
#############################
### Systemd Service Setup ###
#############################

# This script sets up a systemd user service to ensure Dolphin has the correct 
# default apps in Hyprland. It creates the necessary service file, reloads the 
# systemd daemon, enables the service to start on login.
# This ensures that the service is always active in your environment.

# Create the systemd service file
echo "
[Unit]
Description=Ensure Dolphin has the correct default apps on Hyprland

[Service]
ExecStart=/usr/bin/env XDG_MENU_PREFIX=arch- kbuildsycoca6
Restart=on-failure

[Install]
WantedBy=default.target
" > "$HOME/.config/systemd/user/kbuildsycoca.service"

systemctl --user daemon-reload

systemctl --user enable kbuildsycoca.service
