-- Configure monitor settings (preferred resolution, scale, and position)
hl.monitor({ output = "",           mode = "preferred", position = "auto", scale = 1.5 })
hl.monitor({ output = "HDMI-A-1",   mode = "preferred", position = "auto", scale = 1 })

---------------------
--- MY PROGRAMS   ---
---------------------
-- Set default programs
local terminal    = "kitty"
local fileManager = "kitty yazi"
local browser     = "zen-browser"
local browserrule = "zen"
local menu        = "rofi -show drun"

---------------------
--- SOURCES       ---
---------------------
require("hypr-exec")   -- EXEC
require("hypr-env")    -- ENV
require("hypr-look")   -- LOOK
require("hypr-input")  -- INPUT
require("hypr-bind")   -- BIND
require("hypr-rules")  -- RULES

hl.config({
    misc = {
        on_focus_under_fullscreen = 2,
    },
})
-- See https://wiki.hypr.land/configuring/core/monitors/
hl.monitor({
    output   = "",
    mode     = "preferred",
    position = "auto",
    scale    = "auto",
})


---------------------
---- MY PROGRAMS ----
---------------------

-- Set programs that you use
local terminal    = "kitty"
local fileManager = "dolphin"
local menu        = "hyprlauncher"

