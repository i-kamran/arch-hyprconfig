#!bin/bash

# Function to check if a package is installed
pkg_installed() {
    pacman -Q "$1" &>/dev/null
}

# Function to install packages with pacman
install_package() {
    local pkg="$1"
    if ! pkg_installed "$pkg"; then
        sudo pacman -S --noconfirm "$pkg"
    else
        print_green "$pkg is already installed."
    fi
}

install_aur_package() {
  local pkg="$1"
  local selected_helper="$2"
  if ! pkg_installed $pkg; then
    $selected_helper -S --noconfirm "$pkg"
    echo "$pkg installed."
  else
    print_green "$pkg is already installed."
  fi
}

print_green() {
    local text="$1"
    echo -e "\033[0;32m$text\033[0m"
}

print_red() {
    local text="$1"
    echo -e "\033[0;31m$text\033[0m"
}