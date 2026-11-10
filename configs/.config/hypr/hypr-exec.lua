-----------------
--- AUTOSTART ---
-----------------
local v = require("vars")
-- Autostart processes and applications (run once, at Hyprland start)
hl.on("hyprland.start", function()
    hl.exec_cmd("[workspace 3 silent] " .. v.browser)
    hl.exec_cmd("[workspace 4 silent] Telegram")
    hl.exec_cmd("waybar")
    hl.exec_cmd("nm-applet")
    hl.exec_cmd("hypridle")
    hl.exec_cmd("~/.config/change-wallpaper.sh")
    hl.exec_cmd("XDG_MENU_PREFIX=arch- kbuildsycoca6")
    hl.exec_cmd("wl-paste --type text --watch cliphist store")
    hl.exec_cmd("wl-paste --type image --watch cliphist store")
    hl.exec_cmd("wl-clip-persist --clipboard regular")
    hl.exec_cmd("gsettings set org.gnome.desktop.interface gtk-theme 'Layan-Dark'")
    hl.exec_cmd("sudo systemctl start keyd")
end)

-- Replaces `exec-once = export QT_QPA_PLATFORMTHEME=qt6ct`
hl.env("QT_QPA_PLATFORMTHEME", "qt6ct")
