#!/bin/bash

# Notify the user that the system update is starting
notify-send "System Update" "Updating your system."
sleep 1

# Update the system using pacman and AUR packages
if command -v pacman &> /dev/null; then
    notify-send "System Update" "Updating system with pacman..."
    sudo pacman -Syu --noconfirm

elif command -v paru &> /dev/null; then
    notify-send "System Update" "Updating AUR packages."
    paru -Syu --noconfirm

elif command -v yay &> /dev/null; then
    notify-send "System Update" "Updating AUR packages."
    yay -Syu --noconfirm
fi

# Notify the user that the update is complete
notify-send "System Update" "System is updated."
