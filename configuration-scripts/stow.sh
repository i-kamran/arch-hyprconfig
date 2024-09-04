#!/bin/bash

##############################
### Config Symlink Creator ###
##############################

# This script creates symbolic links for configuration files using stow.
# It prompts you to confirm whether to create symlinks for configurations
# in the `.config` directory and home directory. Ensure the stow and
# the relevant configuration directories are properly set up before running.
# Additionally, add the stow script path to the Zsh configuration file

script_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
main_dir="$(dirname "$script_dir")"
configs_dir="$main_dir/configs"

source "$main_dir/install-scripts/functions.sh"

read -p "Do you want to create symlinks of your configs with stow? (Y/n): " response
response=${response:-Y}

if [[ "$response" =~ ^[Yy]$ ]]; then
  # Create .config directory symlinks with stow
  echo "Creating symlinks with stow."
  stow -d "$configs_dir" --adopt -t "$HOME/.config" .config

  # Create home directory symlinks with stow
  stow -d "$configs_dir" --adopt -t "$HOME" home

  # Create home directory symlinks with stow
  stow -d "$main_dir" --adopt -t "$HOME/.config" utility-scripts

  # Add stow script path
  sed -i "s|stowconf=\"stow.sh\"|stowconf=\"$script_dir/stow.sh\"|" "$main_dir/configs/.config/zsh/aliases.zsh"

  echo "$main_dir/configuration-"
  echo
  print_green "########################################"
  print_green "Symlinks created"
else
  echo
  print_green "########################################"
  print_green "Skipping symlink creation."
fi
