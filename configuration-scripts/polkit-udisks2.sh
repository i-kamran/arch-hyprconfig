#!/bin/bash

#################################
### Polkit Rule Configuration ###
########################$########

# This script adds a specific Polkit rule to allow members of the "wheel" group
# to mount filesystems without needing a password. It checks if the target file 
# exists, creates it if necessary, and appends the rule to the file.

script_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
main_dir="$(dirname "$script_dir")"
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

# Check if the file exists
if [ ! -f "$FILE" ]; then
    echo "File $FILE does not exist. Creating it now."
    sudo touch "$FILE"
fi

# Add the content to the file
echo "$CONTENT" | sudo tee "$FILE" > /dev/null


echo "Content added to $FILE successfully."

echo
print_green "########################################"
print_green "Rule is added"