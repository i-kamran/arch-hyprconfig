#!/bin/bash

# Function to check if a device is already in fstab
is_in_fstab() {
    sudo grep -q "$1" /etc/fstab
}

# Function to get filesystem type
get_fs_type() {
    lsblk -no FSTYPE "$1"
}

# Function to get UUID
get_uuid() {
    lsblk -no UUID "$1"
}

# Function to validate fstab entry
validate_fstab_entry() {
    local entry="$1"
    # Check if the entry has 6 fields
    if [[ $(echo "$entry" | awk '{print NF}') -ne 6 ]]; then
        return 1
    fi
    return 0
}

# Backup current fstab
if ! sudo cp /etc/fstab /etc/fstab.backup; then
    echo "Failed to create backup of fstab. Exiting."
    exit 1
fi

# Get all block devices
devices=$(lsblk -dpno NAME | grep -v loop)

for device in $devices; do

    uuid=$(get_uuid "$device" | tr -d '[:space:]')
    fs_type=$(get_fs_type "$device" | tr -d '[:space:]')
    mount_point="/mnt/$(basename "$device")"

    # Skip if UUID is empty
    if [ -z "$uuid" ]; then
        echo "$device has no UUID. Skipping."
        continue
    fi

    # Skip if UUID is already in fstab
    if is_in_fstab "$uuid" || is_in_fstab "$device"; then
        echo "$device (UUID=$uuid) is already in fstab. Skipping."
        continue
    fi

    # Skip if filesystem type is empty or swap
    if [ -z "$fs_type" ] || [ "$fs_type" = "swap" ]; then
        echo "$device has no filesystem or is swap. Skipping."
        continue
    fi

    mount_point=$(echo "$mount_point" | tr -d '[:space:]')
    # Create mount point directory
    if ! sudo mkdir -p "$mount_point"; then
        echo "Failed to create mount point for $device. Skipping."
        continue
    fi

    # Generate fstab entry
    new_entry="UUID=$uuid $mount_point $fs_type defaults 0 2"
    # Validate the new entry
    if ! validate_fstab_entry "$new_entry"; then
        echo "Invalid fstab entry generated for $device. Skipping."
        continue
    fi

    if printf "%s\n" "$new_entry" | sudo tee -a /etc/fstab > /dev/null; then
    echo "Added $device to fstab."
    else
        echo "Failed to add $device to fstab."
    fi
done

echo "fstab update completed."
echo "Please review /etc/fstab before rebooting."

# Verify fstab syntax
if ! sudo mount -fa; then
    echo "Warning: There might be issues with the new fstab entries. Please review carefully."
else
    echo "New fstab entries passed the syntax check."
fi

# Reload systemd
echo "Reloading systemd..."
sudo systemctl daemon-reload
