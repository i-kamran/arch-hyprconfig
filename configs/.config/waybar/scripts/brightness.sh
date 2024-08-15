#!/bin/bash

##########################
### Brightness Control ###
##########################

# This script adjusts the screen brightness using `brightnessctl`.
# It takes a single argument, either "up" or "down", and adjusts the brightness
# by a predefined step percentage.

STEP=5

if [ "$1" == "up" ]; then
  brightnessctl s +${STEP}%
elif [ "$1" == "down" ]; then
  brightnessctl s ${STEP}%- 
fi
