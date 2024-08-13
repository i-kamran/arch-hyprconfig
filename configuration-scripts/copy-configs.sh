#!/bin/bash


script_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
main_dir="$(dirname "$script_dir")"

# Copy to .config
cp -r "$main_dir/configs/.config"* "$HOME/.config" 

# Copy to home directory files only
find "$main_dir/configs/" -maxdepth 1 -type f -exec cp {} "$HOME" \;

echo
print_green "########################################"
print_green "Configs are copied"