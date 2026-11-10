---------------------
--- KEYBINDINGS   ---
---------------------
local v = require("vars")
local mainMod = "SUPER"

-- Basic keybindings
hl.bind(mainMod .. " + Q",      hl.dsp.exec_cmd(v.terminal))
hl.bind(mainMod .. " + F",      hl.dsp.window.fullscreen({ mode = "fullscreen", action = "toggle" }))
hl.bind(mainMod .. " + N",      hl.dsp.exec_cmd("dolphin"))
hl.bind(mainMod .. " + C",      hl.dsp.window.close())
hl.bind(mainMod .. " + Z",      hl.dsp.exit())
hl.bind(mainMod .. " + E",      hl.dsp.exec_cmd(v.fileManager))
hl.bind(mainMod .. " + W",      hl.dsp.window.float({ action = "toggle" }))
hl.bind(mainMod .. " + space",  hl.dsp.exec_cmd(v.menu))
hl.bind(mainMod .. " + B",      hl.dsp.exec_cmd(v.browser))
hl.bind(mainMod .. " + T",      hl.dsp.exec_cmd("Telegram"))
hl.bind(mainMod .. " + P",      hl.dsp.window.pseudo())
hl.bind(mainMod .. " + return", hl.dsp.exec_cmd("hyprlock"))

-- Screenshot settings
local SCREENSHOT_DIR = "/tmp/screenshots"
hl.on("hyprland.start", function()
    hl.exec_cmd("mkdir -p " .. SCREENSHOT_DIR)
end)
hl.bind("SUPER + S", hl.dsp.exec_cmd(
    'grim -g "$(slurp)" ' .. SCREENSHOT_DIR .. '/screenshot.png && wl-copy < ' .. SCREENSHOT_DIR .. '/screenshot.png'
))

-- Cliphist keybinding with rofi
hl.bind("SUPER + V", hl.dsp.exec_cmd("cliphist list | rofi -dmenu | cliphist decode | wl-copy"))

-- Move focus with mainMod + h/j/k/l
hl.bind(mainMod .. " + h", hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + l", hl.dsp.focus({ direction = "right" }))
hl.bind(mainMod .. " + k", hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + j", hl.dsp.focus({ direction = "down" }))

-- Switch workspaces with mainMod + [0-9]
-- Move active window to a workspace with mainMod + SHIFT + [0-9]
for i = 1, 10 do
    local key = i % 10  -- 10 maps to key 0
    hl.bind(mainMod .. " + " .. key,           hl.dsp.focus({ workspace = i }))
    hl.bind(mainMod .. " + SHIFT + " .. key,   hl.dsp.window.move({ workspace = i }))
end

-- Special workspace (scratchpad)
hl.bind(mainMod .. " + d",         hl.dsp.workspace.toggle_special("magic"))
hl.bind(mainMod .. " + SHIFT + d", hl.dsp.window.move({ workspace = "special:magic" }))

-- Scroll through workspaces
hl.bind(mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mainMod .. " + mouse_up",   hl.dsp.focus({ workspace = "e-1" }))

-- Move/resize windows with the mouse
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(),   { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

-- Volume controls (repeat while held)
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("~/.config/waybar/scripts/volume.sh up"),   { repeating = true })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("~/.config/waybar/scripts/volume.sh down"), { repeating = true })
hl.bind("XF86AudioMute", hl.dsp.exec_cmd('pactl set-sink-mute @DEFAULT_SINK@ toggle; notify-send "Toggle mute"'), { repeating = true })

-- Mic controls
hl.bind("XF86AudioMicMute", hl.dsp.exec_cmd('wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle; notify-send "Toggle mic"'), { repeating = true })

-- Brightness
hl.bind("XF86MonBrightnessUp",   hl.dsp.exec_cmd("brightnessctl set +5%"), { repeating = true })
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl set 5%-"), { repeating = true })

-- Media keys (work while locked)
hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioNext", hl.dsp.exec_cmd("playerctl next"),       { locked = true })
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("playerctl previous"),   { locked = true })
