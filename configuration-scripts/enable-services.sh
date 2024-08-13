#!/bin/bash

script_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
main_dir="$(dirname "$script_dir")"
source "$main_dir/install-scripts/functions.sh"

systemctl --user enable pipewire.service
sudo systemctl enable bluetooth.service
sudo systemctl enable sddm.service

echo
print_green "########################################"
print_green "Services are enabled"