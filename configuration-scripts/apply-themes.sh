#!/bin/bash

###########################
### Theme Configuration ###
###########################

# This script applies various themes and configurations to the system.
# It sets the Papirus-Dark theme for folder icons, applies the sddm-astronaut-theme
# to SDDM, updates the SDDM configuration, and sets Kitty as the default terminal in Dolphin.

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

# Apply sddm-astronaut-theme
THEME="/usr/share/sddm/themes/sddm-astronaut-theme"
script_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

if sudo git clone https://github.com/keyitdev/sddm-astronaut-theme.git "$THEME" &&
   sudo cp /usr/share/sddm/themes/sddm-astronaut-theme/Fonts/* /usr/share/fonts/ &&
   sudo cp -r "$main_dir/configs/.config/wallpapers" "$THEME/wallpapers/" &&
   echo "[Theme]\nCurrent=sddm-astronaut-theme" | sudo tee /etc/sddm.conf &&
   sudo sed -i 's/FormPosition="center"/FormPosition="right"/' "$THEME/theme.conf" &&
   sudo sed -i 's|^Background=.*|Background="wallpapers/oxxaca-TNdTGcexUNY-unsplash.jpg"|' "$THEME/theme.conf"; then
    print_green "sddm-astronaut-theme applied successfully."
else
    print_red "Failed to apply sddm-astronaut-theme."
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

