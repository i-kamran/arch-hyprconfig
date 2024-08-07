#!/bin/bash

# Script to move noi.AppImage and create desktop entry

source "$(dirname "$0")/global_functions.sh"

echo "Moving Applications directory to ~/Applications"
# Create Applications directory in home if it doesn't exist
mkdir -p ~/Applications

# Move the Applications directory from the current directory to ~/Applications
if [ -d "Applications" ]; then
  mv Applications ~/Applications/
  echo "Moved Applications directory to ~/Applications/"
else
  echo "No Applications directory found in the current directory"
fi

echo "Creating desktop entry"

# Create a desktop entry with the home directory
desktop_entry="[Desktop Entry]
Name=Noi
Comment=Noi Application
Exec=$HOME/Applications/Applications/noi.AppImage
Icon=$HOME/Applications/Applications/icons/noi.png
Terminal=false
Type=Application
Categories=Utility;"

# Ensure the directory exists and is writable
desktop_entry_dir="$(dirname "$HOME/.local/share/applications/noi.desktop")"
if [ ! -d "$desktop_entry_dir" ]; then
  sudo mkdir -p "$desktop_entry_dir"
fi

# Write the desktop entry using sudo
echo "$desktop_entry" | sudo tee "$HOME/.local/share/applications/noi.desktop" > /dev/null

# Check if the file was created successfully
if [ -f "$HOME/.local/share/applications/noi.desktop" ]; then
  echo "Desktop entry created at $HOME/.local/share/applications/noi.desktop"
else
  echo "Failed to create desktop entry"
fi
