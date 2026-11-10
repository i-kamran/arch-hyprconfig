-----------------
--- INPUT     ---
-----------------
-- Input settings
hl.config({
    input = {
        kb_layout  = "us,us",
        kb_variant = ",dvp",
        kb_model   = "",
        kb_options = "grp:alt_shift_toggle",
        kb_rules   = "",
        follow_mouse = 1,
        sensitivity  = 0,
        touchpad = {
            natural_scroll = true,
        },
    },
})

-- Gesture settings
-- hl.config({
--     gestures = {
--         workspace_swipe = false,
--     },
-- })

-- Example per-device configuration
hl.device({
    name = "epic-mouse-v1",
    sensitivity = -0.5,
})
