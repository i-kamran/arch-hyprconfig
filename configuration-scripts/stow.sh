#!/bin/bash

script_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
main_dir="$(dirname "$script_dir")"
configs_dir="$main_dir/configs"

source "$main_dir/install-scripts/functions.sh"

read -p "Do you want to create symlinks of your configs with stow? (Y/n): " response
response=${response:-Y}

if [[ "$response" =~ ^[Yy]$ ]]; then
  # Create .config directory symlinks with stow
  echo "Creating symlinks with stow."
  stow -d "$configs_dir" --adopt -t ~/.config .config

  # Create home directory symlinks with stow
  stow -d "$configs_dir" --adopt -t ~ home

  echo
  print_green "########################################"
  print_green "Symlinks created"
else
  echo
  print_green "########################################"
  print_green "Skipping symlink creation."
fi