#!/bin/bash

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