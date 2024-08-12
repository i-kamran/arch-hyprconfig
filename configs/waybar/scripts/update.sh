#!/bin/bash

# Notify the user that the system update is starting
notify-send "System Update" "Updating your system."

# Update the system using pacman and AUR packages
if command -v pacman &> /dev/null; then
    echo "Updating system with pacman..."
    sudo pacman -Syu --noconfirm

elif command -v paru &> /dev/null; then
    notify-send "System Update" "Updating AUR packages."
    sudo paru -Syu --noconfirm

elif command -v yay &> /dev/null; then
    notify-send "System Update" "Updating AUR packages."
    sudo yay -Syu --noconfirm


# Notify the user that the update is complete
notify-send "System Update" "System and AUR packages have been updated."
