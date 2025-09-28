#!/bin/bash

# Save to current working directory
SAVE_DIR="$PWD"

# Prompt for image name
read -rp "📷 Enter image name (leave blank for timestamp): " NAME

# Default to timestamp if name is empty
if [[ -z "$NAME" ]]; then
  NAME="img-$(date +%Y%m%d-%H%M%S)"
fi

# Ensure .png extension
FILENAME="${NAME%.png}.png"
FULL_PATH="${SAVE_DIR}/${FILENAME}"

# Try to get image from clipboard
wl-paste --type image/png > "$FULL_PATH"

# Validate
if [[ ! -s "$FULL_PATH" ]]; then
  echo "❌ No image found in clipboard or invalid format."
  rm -f "$FULL_PATH"
  exit 1
fi

echo "✅ Saved image: $FILENAME"

