#!bin/bash

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
#   $1 - The name of the script to run.
#   $2 - The directory where the script is located.
# Description:
#   It checks if the target script exists and runs it.
run_script() {
  local script="$1"
  local directory="$2"
  
  # Check if the script file exists
  if [[ ! -f "$directory/$script" ]]; then
    echo "Script not found: $directory/$script"
    return 1
  fi
  
  # Execute the script
  "$directory/"./"$script"
}

# Function: make_executable
# Arguments:
#   $1 - The name of the script to run.
#   $2 - The directory where the script is located.
# Description:
#   It checks if the target script exists and makes it executable.
make_executable() {
  local script="$1"
  local directory="$2"
  
  # Check if the script file exists
  if [[ ! -f "$directory/$script" ]]; then
    echo "Script not found: $directory/$script"
    return 1
  fi

  # Make the script executable
  chmod +x "$directory/$script"
}
