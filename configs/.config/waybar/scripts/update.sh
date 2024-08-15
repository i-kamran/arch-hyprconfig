#!/bin/bash

############################
### System Update Script ###
############################

# This script updates an Arch or Arch-based system. It logs the update process, checks 
# for the system's compatibility, identifies the AUR helper (paru or yay), counts 
# available updates, performs the update, and notifies the user of the status.


# Define the log file location and maximum size in bytes (e.g., 10 MB)
log_file="$HOME/.config/system_update.log"
max_size=$((10 * 1024 * 1024))  # 10 MB

# Truncate the log file if it exceeds the maximum size
if [ -f "$log_file" ]; then
    current_size=$(stat -c%s "$log_file")
    if [ "$current_size" -ge "$max_size" ]; then
        > "$log_file"
    fi
fi

# Start logging
echo -e "\n\nStarting system update at $(date)" >> "$log_file"

# Check if the system is Arch or an Arch-based derivative
if ! grep -q -i "arch" /etc/os-release; then
    notify-send -t 5000 "System Update Canceled" "This system is not Arch or an Arch derivative."
    echo "System update canceled: Not an Arch-based system." >> "$log_file"
    exit 0
fi

# Notify the user that the system update is starting
notify-send -t 3000 "System Update" "Starting system update."
echo "System update starting." >> "$log_file"

# Determine which AUR helper is installed
if command -v paru &> /dev/null; then
    aur_helper="paru"
elif command -v yay &> /dev/null; then
    aur_helper="yay"
else
    notify-send -t 5000 "System Update Error" "Neither paru nor yay is installed."
    echo "System update error: Neither paru nor yay is installed." >> "$log_file"
    exit 1
fi

# Pause for a moment 
sleep 1.5

# Count available updates
count_pacman=$($aur_helper -Qu | wc -l)
count_aur=$($aur_helper -Qua | wc -l)
echo "Available updates - Pacman: $count_pacman, AUR: $count_aur" >> "$log_file"

# Notify the user of the number of available updates
notify-send -t 3000 "Available updates:" "Pacman - $count_pacman\nAUR - $count_aur"

# Pause for a moment before updating
sleep 3

# Perform the system update using aur helper
notify-send -t 2000 "System Update" "Updating system with $aur_helper..."
echo "Updating system with $aur_helper..." >> "$log_file"
{
    $aur_helper -Syu --noconfirm 2>&1
} >> "$log_file" 2>&1

# Notify the user that the update is complete
notify-send -t 2000 "System Update Complete" "System has been updated."
echo "System update completed successfully at $(date)" >> "$log_file"
