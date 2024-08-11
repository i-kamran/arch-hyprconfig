#!/bin/bash

# Variables
SCRIPT_PATH="$HOME/.config/waybar/scripts/update.sh"
USERNAME="$(whoami)"
SUDOERS_FILE="/etc/sudoers"

# Function to add entry to sudoers
add_sudoers_entry() {
    echo "$USERNAME ALL=(ALL) NOPASSWD: $SCRIPT_PATH" | sudo tee -a "$SUDOERS_FILE" > /dev/null
}

# Function to check sudoers syntax
check_sudoers() {
    sudo visudo -c -f "$SUDOERS_FILE"
}

# Add entry and check syntax
add_sudoers_entry

if check_sudoers; then
    echo "Entry added to sudoers successfully."
else
    # If the syntax check fails, remove the last added entry
    sudo sed -i "\|$SCRIPT_PATH|d" "$SUDOERS_FILE"
    echo "Syntax check failed. Entry not added."
fi