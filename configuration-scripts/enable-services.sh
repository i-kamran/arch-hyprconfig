#!/bin/bash

systemctl --user enable pipewire.service
sudo systemctl enable bluetooth.service
sudo systemctl enable sddm.service

echo
print_green "########################################"
print_green "Services are enabled"