#!/bin/bash

script_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
main_dir="$(dirname "$script_dir")"
utility_scripts_dir="$main_dir/utility-scripts"
source "$main_dir/install-scripts/functions.sh"

for file in $utility_scripts_dir/*
do
  make_executable $file
  cp $file "$HOME/.config"
done

echo
print_green "########################################"
print_green "Configs are copied"