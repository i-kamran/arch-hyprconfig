#!/bin/bash

#############################
### Utility Scripts Setup ###
#############################

# This script sets up utility scripts by making them executable and copying 
# them to the appropriate configuration directory. It ensures that all utility 
# scripts are ready to use in your environment.

# Determine the directory containing this script and the main directory
script_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
main_dir="$(dirname "$script_dir")"
utility_scripts_dir="$main_dir/utility-scripts"

# Source the functions.sh script to use print_green and print_red
# These functions provide colored output for success and error messages
source "$main_dir/install-scripts/functions.sh"

# Initialize a flag to track success or failure
success=true

# Iterate over each file in the utility-scripts directory
for file in "$utility_scripts_dir"/*; do
  # Make the file executable
  if make_executable "$file"; then
    print_green "Made $file executable."
  else
    print_red "Failed to make $file executable."
    success=false
  fi

  # Copy the file to the .config directory
  if cp "$file" "$HOME/.config"; then
    print_green "Copied $file to $HOME/.config."
  else
    print_red "Failed to copy $file to $HOME/.config."
    success=false
  fi
done

# Print a final message based on the success or failure of the operations
echo
if [ "$success" = true ]; then
    print_green "########################################"
    print_green "Utility scripts are set up successfully."
else
    print_red "########################################"
    print_red "One or more utility scripts setup operations failed."
fi
