#!/bin/bash

STEP=5

if [ "$1" == "up" ]; then
  brightnessctl s +${STEP}%
elif [ "$1" == "down" ]; then
  brightnessctl s ${STEP}%- 
fi
