#!/bin/bash
notify-send "System Update" "Updating your system."
# Update the system using pacman
echo "Updating system with pacman..."
sudo pacman -Syu --noconfirm

# Update AUR packages using paru
notify-send "System Update" "Updating AUR packages."

echo "Updating AUR packages with paru..."
paru -Syu --noconfirm

# Notify user that the update is complete
notify-send "System Update" "System and AUR packages have been updated."


