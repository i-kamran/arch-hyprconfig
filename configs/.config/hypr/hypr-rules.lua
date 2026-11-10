------------------------------
--- WINDOWS AND WORKSPACES ---
------------------------------
local v = require("vars")

-- Window rules
hl.window_rule({
    name = "suppress-maximize-events",
    match = { class = ".*" },
    suppress_event = "maximize",
})

hl.window_rule({
    name = "browser-opacity",
    match = { class = v.browserrule },
    opacity = "0.97 0.85",
})

-- Workspace rules
hl.workspace_rule({ workspace = "1",  monitor = "eDP-1" })
hl.workspace_rule({ workspace = "2",  monitor = "eDP-1" })
hl.workspace_rule({ workspace = "3",  monitor = "HDMI-A-1" })
hl.workspace_rule({ workspace = "4",  monitor = "HDMI-A-1" })
hl.workspace_rule({ workspace = "5",  monitor = "HDMI-A-1" })
hl.workspace_rule({ workspace = "6",  monitor = "eDP-1" })
hl.workspace_rule({ workspace = "7",  monitor = "eDP-1" })
hl.workspace_rule({ workspace = "8",  monitor = "HDMI-A-1" })
hl.workspace_rule({ workspace = "9",  monitor = "HDMI-A-1" })
hl.workspace_rule({ workspace = "10", monitor = "HDMI-A-1" })
