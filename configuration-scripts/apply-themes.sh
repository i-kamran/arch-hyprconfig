#!/bin/bash

###########################
### Theme Configuration ###
###########################

# This script applies various themes and configurations to the system.
# It sets the Papirus-Dark theme for folder icons, adjusts Ly configuration,
# and sets Kitty as the default terminal in Dolphin.

# Get the script directory and main directory
script_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
main_dir="$(dirname "$script_dir")"
source "$main_dir/install-scripts/functions.sh"

echo "Applying themes"

# Flag to track overall success
success=true

# Apply Papirus-Dark theme
if papirus-folders --theme Papirus-Dark -C cat-mocha-teal; then
    print_green "Papirus-Dark theme applied successfully."
else
    print_red "Failed to apply Papirus-Dark theme."
    success=false
fi

# Apply ly
ly="/etc/ly"
script_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

if 
  sudo sed -i 's/clear_password = false/clear_password = true/' "$ly/config.ini" &&
  sudo sed -i 's/default_input = login/default_input = password/' "$ly/config.ini"; then
  echo
    print_green "ly config applied successfully."
else
    print_red "Failed to apply ly config."
    success=false
fi

# Make kitty default terminal in Dolphin
FILE="$HOME/.config/kdeglobals"
if echo -e "[General]\nTerminalApplication=kitty" | tee -a "$FILE"; then
    print_green "Kitty set as default terminal in Dolphin."
else
    print_red "Failed to set Kitty as default terminal in Dolphin."
    success=false
fi

# Apply GNOME themes
if gsettings set org.gnome.desktop.interface icon-theme 'Papirus-Dark'; then
    print_green "Papirus-Dark theme applied to GNOME."
else
    print_red "Failed to apply Papirus-Dark theme to GNOME."
    success=false
fi

# Final completion message
echo
if $success; then
    print_green "########################################"
    print_green "Themes are applied successfully."
else
    print_red "########################################"
    print_red "Some themes failed to apply."
fi
