#!bin/bash

########################
### Global Functions ###
########################

# This script contains utility functions for managing packages and scripts.
# It includes functions to:
# - Check if a package is installed
# - Install packages using pacman or an AUR helper
# - Print messages in green or red
# - Run and manage scripts


# Function: pkg_installed
# Arguments:
#   $1 - The name of the package to check.
# Description:
#   This function checks if a given package is installed using pacman.
pkg_installed() {
    pacman -Q "$1" &>/dev/null
}

# Function: install_package
# Arguments:
#   $1 - The name of the package to install.
# Description:
#   This function installs a package using pacman if it is not already installed.
install_package() {
    local pkg="$1"
    if ! pkg_installed "$pkg"; then
        sudo pacman -S --noconfirm "$pkg"
    else
        print_green "$pkg is already installed."
    fi
}

# Function: install_aur_package
# Arguments:
#   $1 - The name of the AUR package to install.
#   $2 - The name of the AUR helper to use (e.g., paru, yay).
# Description:
#   This function installs an AUR package using the specified AUR helper.
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

# Function: print_green
# Arguments:
#   $1 - The text to print.
# Description:
#   This function prints the provided text in green color.
print_green() {
    local text="$1"
    echo -e "\033[0;32m$text\033[0m"
}

# Function: print_red
# Arguments:
#   $1 - The text to print.
# Description:
#   This function prints the provided text in red color.
print_red() {
    local text="$1"
    echo -e "\033[0;31m$text\033[0m"
}

# Function: run_script
# Arguments:
#   $1 - The full path to the script to run.
# Description:
#   It checks if the target script exists and runs it.
run_script() {
  local script_path="$1"
  
  # Check if the script file exists
  if [[ ! -f "$script_path" ]]; then
    echo "Script not found: $script_path"
    return 1
  fi
  
  # Execute the script
  "$script_path"
}

# Function: make_executable
# Arguments:
#   $1 - The full path to the script.
# Description:
#   It checks if the target script exists and makes it executable.
make_executable() {
  local script_path="$1"
  
  # Check if the script file exists
  if [[ ! -f "$script_path" ]]; then
    echo "Script not found: $script_path"
    return 1
  fi

  # Make the script executable
  chmod +x "$script_path"
}

# Function: make_exec_and_run
# Arguments:
#   $1 - The full path to the script.
# Description:
#   It checks if the target script exists, makes it executable and runs it. 
make_exec_and_run() {
  local script_path="$1"
  make_executable "$script_path"
  run_script "$script_path"
}