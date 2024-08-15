#!/bin/bash
#############################
### Volume Control Script ###
#############################

# This script adjusts the system volume using `pactl` and plays a sound notification.
# It takes an argument ("up" or "down") to increase or decrease the volume by a set step.
# It ensures the volume does not exceed a defined limit when increasing.

STEP=5
LIMIT=200
SINK=@DEFAULT_SINK@

# Get current volume level
current_volume=$(pactl get-sink-volume $SINK | awk '{print $5}' | sed 's/%//')

# Adjust volume
if [ "$1" == "up" ]; then
    pactl set-sink-mute $SINK 0
  # Check if current volume is less than the limit
  if [ "$current_volume" -lt "$LIMIT" ]; then
    pactl set-sink-volume $SINK +${STEP}%
  fi
elif [ "$1" == "down" ]; then
  pactl set-sink-mute $SINK 0
  pactl set-sink-volume $SINK -${STEP}%
fi

# Play the sound
mpv --no-video ~/.config/waybar/scripts/pop.mp3