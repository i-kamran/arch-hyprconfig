#!/bin/bash

# Variables
USERNAME="$(whoami)"
SUDOERS_FILE="/etc/sudoers.d/pacman_sudoer"

# Create the sudoers.d file with pacman entry
add_pacman_sudoer_entry() {
    echo "$USERNAME ALL=(ALL) NOPASSWD: /usr/bin/pacman" | sudo tee "$SUDOERS_FILE" > /dev/null
}

# Function to check sudoers syntax
check_sudoers() {
    sudo visudo -c -f "$SUDOERS_FILE"
}

# Add entry and check syntax
add_pacman_sudoer_entry

if check_sudoers; then
    echo "Pacman entry added to sudoers successfully."
else
    # If the syntax check fails, remove the sudoers file
    sudo rm -f "$SUDOERS_FILE"
    echo "Syntax check failed. Sudoers entry removed."
fi
