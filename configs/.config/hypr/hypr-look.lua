-----------------------
--- LOOK AND FEEL   ---
-----------------------
-- General appearance settings
hl.config({
    general = {
        gaps_in = 2,
        gaps_out = 4,
        border_size = 0,
        col = {
            active_border   = "rgba(82D1C7ff)",
            inactive_border = "rgba(595959aa)",
        },
        resize_on_border = true,
        allow_tearing = false,
        layout = "dwindle",
    },

    -- Window decoration settings
    decoration = {
        rounding = 8,
        active_opacity = 0.9,
        inactive_opacity = 0.75,
        blur = {
            enabled = true,
            size = 15,
            passes = 2,
            vibrancy = 0.1696,
        },
    },

    -- Animation settings
    animations = {
        enabled = true,
    },

    -- Master layout settings
    master = {
        new_status = "master",
    },

    -- Miscellaneous settings
    misc = {
        force_default_wallpaper = 0,
        disable_hyprland_logo = true,
    },
})

-- Animation curves and rules
hl.curve("myBezier", { type = "bezier", points = { {0.05, 0.9}, {0.1, 1.05} } })

hl.animation({ leaf = "windows",     enabled = true, speed = 7,  bezier = "myBezier" })
hl.animation({ leaf = "windowsOut",  enabled = true, speed = 7,  bezier = "default", style = "popin 80%" })
hl.animation({ leaf = "border",      enabled = true, speed = 10, bezier = "default" })
hl.animation({ leaf = "borderangle", enabled = true, speed = 8,  bezier = "default" })
hl.animation({ leaf = "fade",        enabled = true, speed = 7,  bezier = "default" })
hl.animation({ leaf = "workspaces",  enabled = true, speed = 6,  bezier = "default" })

-- Dwindle layout settings
-- hl.config({
--     dwindle = {
--         pseudotile = true,
--         preserve_split = true,
--     },
-- })
