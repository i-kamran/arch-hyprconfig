#!/bin/bash

source "$(dirname "$0")/global_functions.sh"

echo "Applying themes"
# Apply styles
if pkg_installed "kvantummanager"; then
  kvantummanager --set Layan
else
  echo "No kvantum manager found"
fi
