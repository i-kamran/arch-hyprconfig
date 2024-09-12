#!/bin/bash

###################################
### Dolphin Configuration Setup ###
###################################

# This script ensures that the '[Icons]' section in the Dolphin configuration file
# contains the 'Theme=Papirus-Dark' line.

FILE="$HOME/.config/dolphinrc"

script_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
install_dir="$(dirname "$script_dir")/install-scripts"
source "$install_dir/functions.sh"

if [ ! -f "$FILE" ]; then
    touch "$FILE"
fi

if grep -q "^\[Icons\]" "$FILE"; then
  if grep -q "^Theme=Papirus-Dark" "$FILE"; then
    print_green "Theme is already set to Papirus-Dark"
  else
    if  sed -i "/^\[Icons\]/a Theme=Papirus-Dark" "$FILE"; then
      print_green "Papirus-Dark icon theme is added"
    else
      print_red "Failed to add icon theme"
    fi
  fi
else 
  if echo -e "\n[Icons]\nTheme=Papirus-Dark" >> "$FILE"; then
    print_green "Added the [Icons] section with 'Theme=Papirus-Dark'."
  else
    print_red "Failed to add the [Icons] section with 'Theme=Papirus-Dark'"
  fi
fi
