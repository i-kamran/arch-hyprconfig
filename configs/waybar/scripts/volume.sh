#!/bin/bash

STEP=5
# FIX unmute if volume is increased or descreased
if [ "$1" == "up" ]; then
  pactl set-sink-mute @DEFAULT_SINK@ 0
  pactl set-sink-volume @DEFAULT_SINK@ +${STEP}%
elif [ "$1" == "down" ]; then
  pactl set-sink-mute @DEFAULT_SINK@ 0
  pactl set-sink-volume @DEFAULT_SINK@ -${STEP}%
fi
