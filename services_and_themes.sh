systemctl --user enable pipewire.service
systemctl --user enable pipewire.service
sudo systemctl enable bluetooth.service
sudo systemctl enable sddm.service

echo "Applying themes"
papirus-folders --theme Papirus-Dark -C cat-mocha-teal

# Apply sddm theme
#!/bin/bash

THEME="/usr/share/sddm/themes/sddm-astronaut-theme"
script_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

sudo git clone https://github.com/keyitdev/sddm-astronaut-theme.git "$THEME"
sudo cp /usr/share/sddm/themes/sddm-astronaut-theme/Fonts/* /usr/share/fonts/

sudo cp -r "$script_dir/configs/wallpapers" "$THEME/wallpapers/"
echo "[Theme]
Current=sddm-astronaut-theme" | sudo tee /etc/sddm.conf

sudo sed -i 's/FormPosition="center"/FormPosition="right"/' "$THEME/theme.conf"

# Use sed to replace the Background line with the new wallpaper path
sudo sed -i 's|^Background=.*|Background="wallpapers/ox.jpg"|' "$THEME/theme.conf"