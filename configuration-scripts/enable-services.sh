#!/bin/bash

################################
### System Services Enabler  ###
################################

# This script enables essential system services, including Pipewire, Bluetooth, 
# and SDDM.

script_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
main_dir="$(dirname "$script_dir")"
source "$main_dir/install-scripts/functions.sh"

systemctl --user enable pipewire.service
sudo systemctl enable bluetooth.service
sudo systemctl enable sddm.service

# Change power key behavior to suspend
sudo sed -i -e "s/^#HandlePowerKey=poweroff/HandlePowerKey=suspend/" \
    -e 's/^#HandlePowerKeyLongPress=ignore/HandlePowerKeyLongPress=poweroff/' \
    -e 's/^#HandleLidSwitch=/HandleLidSwitch=/' /etc/systemd/logind.conf
echo
print_green "########################################"
print_green "Services are enabled"