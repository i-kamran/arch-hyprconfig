#!/bin/bash

###########################
### Noi and Yazi config ###
###########################

# Script creates a wrapper for noi-desktop to enable Wayland support,
# installs Yazi plugins and set default mime types

echo "Enabling Noi Wayland support and installing Yazi plugins"

# Create the wrapper script
sudo bash -c 'cat > /usr/local/bin/noi-desktop << EOF
#!/bin/bash
/usr/bin/noi-desktop --ozone-platform-hint=wayland --disable-gpu "\$@"
EOF'

# Make the wrapper script executable
sudo chmod +x /usr/local/bin/noi-desktop

# Set Gwenview as default for jpeg, png, webp
xdg-mime default org.kde.gwenview.desktop image/jpeg image/png image/webp

# Downdload yazi mount and git plugins
ya pack -a yazi-rs/plugins:git
ya pack -a yazi-rs/plugins:mount

echo "Script finished successfully"

