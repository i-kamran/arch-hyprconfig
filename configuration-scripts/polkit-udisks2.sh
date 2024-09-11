#!/bin/bash

#################################
### Polkit Rule Configuration ###
#################################

# This script adds a specific Polkit rule to allow members of the "wheel" group
# to mount filesystems without needing a password. It checks if the target file 
# exists, creates it if necessary, and appends the rule to the file.

# Determine the directory containing this script and the main directory
script_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
main_dir="$(dirname "$script_dir")"

# Source the functions.sh script to use print_green and print_red
# These functions provide colored output for success and error messages
source "$main_dir/install-scripts/functions.sh"

# Define the file path
FILE="/etc/polkit-1/rules.d/drive.rules"

# Define the content to add
CONTENT='polkit.addRule(function(action, subject) {
    if (action.id == "org.freedesktop.udisks2.filesystem-mount-system" &&
        subject.isInGroup("wheel")) {
        return polkit.Result.YES;
    }
});'

# Initialize a flag to track success or failure
success=true

# Check if the file exists
if [ ! -f "$FILE" ]; then
    print_green "File $FILE does not exist. Creating it now."
    # Create the file with root permissions
    if sudo touch "$FILE"; then
        print_green "File $FILE created successfully."
    else
        print_red "Failed to create file $FILE."
        success=false
    fi
fi

# Add the content to the file
# Redirect output to /dev/null to suppress tee's output
if echo "$CONTENT" | sudo tee "$FILE" > /dev/null; then
    print_green "Content added to $FILE successfully."
else
    print_red "Failed to add content to $FILE."
    success=false
fi

# Print a final message based on the success or failure of the operations
echo
if [ "$success" = true ]; then
    print_green "########################################"
    print_green "Polkit rule is added successfully."
else
    print_red "########################################"
    print_red "One or more operations failed in Polkit rule configuration."
fi
