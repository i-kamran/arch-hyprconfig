#!/bin/bash

###################
### Noi Wayland ###
###################

# Script creates a wrapper for noi-desktop to enable Wayland support

echo "Enabling Noi Wayland support"

# Create the wrapper script
sudo bash -c 'cat > /usr/local/bin/noi-desktop << EOF
#!/bin/bash
/usr/bin/noi-desktop --ozone-platform-hint=wayland --disable-gpu "\$@"
EOF'

# Make the wrapper script executable
sudo chmod +x /usr/local/bin/noi-desktop

echo "Noi Wayland support enabled successfully"
