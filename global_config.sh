#!/bin/bash

#############################
### Global Configuration  ###
#############################

# This configuration file defines which AUR helpers,
# code editors, and other tools will be installed.
# It is sourced by the installation script to determine
# what to install.

###################
### AUR Helpers ###
###################
AUR_HELPERS=("paru" "yay")

#######################
### Pacman Packages ###
########################
PACKAGES=("vim" "neovim" "firefox" "fastfetch" "btop" "stow" "tldr" "man" "grim" "slurp" "cliphist" "waybar" "mako" "polkit-gnome" "pamixer" "pavucontrol" "brightnessctl" "bluez" "bluez-utils" "blueman" "network-manager-applet" "gvfs" "thunar-archive-plugin" "file-roller" "starship" "lxappearance" "xfce4-settings pipewire pipewire-pulse pipewire-alsa pipewire-jack wireplumber") 

####################
### AUR Packages ###
####################
AUR_PACKAGES=("visual-studio-code-bin" "ttf-ms-fonts" "hyrpland" "hyprpaper" "rofi-lbonn-wayland-git" "wlogout-git" "xdg-desktop-portal-hyprland-git")
