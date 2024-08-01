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
PACKAGES=("vim" "neovim" "firefox" "fastfetch" "btop" "stow" "tldr" "man")

####################
### AUR Packages ###
####################
AUR_PACKAGES=("visual-studio-code-bin" "ttf-ms-fonts" "hyrpland" "hyprpaper")
