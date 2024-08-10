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
PACKAGES=(
    # Utilities
    "firefox" "hyprland" "stow" "wget" "fzf" "mako" "waybar" "pamixer" "pavucontrol" 
    "gvfs" "sddm" "hyprpaper" "fuse" "kitty" "polkit-kde-agent" 
    "qt5-wayland" "qt6-wayland" "qt6ct" "dolphin" "xdg-desktop-portal-hyprland"
    "archlinux-xdg-menu" "brightnessctl"
    # Theme
    "kvantum" "papirus-icon-theme"
    # Clipboard
    "grim" "slurp" "cliphist"
    # Bluetooth & Wi-Fi
    "bluez" "bluez-utils" "blueman" "network-manager-applet"
    # Misc
    "bat" "tldr" "man" "fastfetch" "btop" "starship" "telegram-desktop" "zoxide" 
    "ttf-jetbrains-mono-nerd" "aspell"
)

####################
### AUR Packages ###
####################

AUR_PACKAGES=("visual-studio-code-bin" "ttf-ms-fonts" "rofi-lbonn-wayland-git" 
    "wlogout-git" "noi-desktop-bin" "deepin-gtk-theme" "plasma6-themes-layan-git" "papirus-folders-catppuccin-git" )
