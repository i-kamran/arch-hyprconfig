#!/bin/bash

# Set the wallpaper directory
WALLPAPER_DIR="$HOME/.config/wallpapers"
INDEX_FILE="$HOME/.config/.last_wallpaper_index"

# Check if the directory exists
if [ ! -d "$WALLPAPER_DIR" ]; then
    echo "Wallpaper directory does not exist: $WALLPAPER_DIR"
    exit 1
fi

# Get a list of all wallpapers in the directory
WALLPAPERS=("$WALLPAPER_DIR"/*)

# Check if the INDEX_FILE exists; if not, create it with index 0
if [ ! -f "$INDEX_FILE" ]; then
    echo 0 > "$INDEX_FILE"
fi

# Read the last index from the file
LAST_INDEX=$(<"$INDEX_FILE")

# Calculate the next index
NEXT_INDEX=$((LAST_INDEX + 1))

# If the next index exceeds the number of wallpapers, reset to 0
if [ "$NEXT_INDEX" -ge "${#WALLPAPERS[@]}" ]; then
    NEXT_INDEX=0
fi

# Get the next wallpaper
WALLPAPER="${WALLPAPERS[$NEXT_INDEX]}"

# Check if swww daemon is running, if not start it
if ! pgrep -x "swww-daemon" > /dev/null; then
    swww-daemon
    sleep 1  
fi

# Set the wallpaper
swww img "$WALLPAPER" --transition-fps 30 --transition-type any --transition-duration 3

# Save the next index to the file
echo "$NEXT_INDEX" > "$INDEX_FILE"

echo "Set wallpaper: $(basename "$WALLPAPER")"
