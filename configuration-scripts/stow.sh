#!/bin/bash

##############################
### Config Symlink Creator ###
##############################

# This script creates symbolic links for configuration files using stow.
# It prompts you to confirm whether to create symlinks for configurations
# in the `.config` directory and home directory. Ensure that stow and
# the relevant configuration directories are properly set up before running.

# Define directories
script_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
main_dir="$(dirname "$script_dir")"
configs_dir="$main_dir/configs"
bin_dir="$HOME/.local/bin"

# Source functions
source "$main_dir/install-scripts/functions.sh"

# Prompt user for confirmation
read -r -p "Do you want to create symlinks of your configs with stow? (Y/n): " response
response=${response:-Y}

if [[ "$response" =~ ^[Yy]$ ]]; then
  # Create .config directory symlinks with stow
  echo "Creating symlinks with stow."
  stow -d "$configs_dir" --adopt -t "$HOME/.config" .config

  # Create home directory symlinks with stow
  stow -d "$configs_dir" --adopt -t "$HOME" home

  # Create utility scripts symlinks with stow
  stow -d "$main_dir" --adopt -t "$HOME/.config" utility-scripts

  # Ensure bin directory exists
  mkdir -p "$bin_dir"

  # Add stow scripts to bin
  echo "#!/bin/bash
stow -d \"$configs_dir\" --adopt -t \"$HOME/.config\" .config
stow -d \"$configs_dir\" --adopt -t \"$HOME\" home
stow -d \"$main_dir\" --adopt -t \"$HOME/.config\" utility-scripts" > "$bin_dir/stowconf"

  # Make the script executable
  chmod +x "$bin_dir/stowconf"

  echo
  print_green "########################################"
  print_green "Symlinks created"
else
  echo
  print_green "########################################"
  print_green "Skipping symlink creation."
fi

