#!/bin/bash

script_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
main_dir="$(dirname "$script_dir")"
source "$main_dir/install-scripts/functions.sh"

# Copy to .config
cp -r "$main_dir/configs/.config"* "$HOME/.config" 

# Copy to home directory
cp -r "$main_dir/configs/home"* "$HOME" 

echo
print_green "########################################"
print_green "Configs are copied"