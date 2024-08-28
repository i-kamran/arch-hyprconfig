-- ~/.config/nvim/lua/plugins/colors-cat.lua

return {
    "catppuccin/nvim",
    lazy = false,
    name = "catppuccin",
    priority = 1000,
    config = function()
        -- Define the custom palette
        local mocha = require("catppuccin.palettes").get_palette("mocha")

        -- Setup Catppuccin with custom colors and integrations
        require("catppuccin").setup({
            color_overrides = {
                mocha = {
                    text = "#E8E4D6",
                    base = "#1C1C19",
                    mantle = "#171512",
                    crust = "#0D0D0B",
                    surface0 = "#332F2E",
                    surface1 = "#4D4645",
                    surface2 = "#665D5C",
                    overlay0 = "#8C8685",
                    overlay1 = "#B3ABAA",
                    overlay2 = "#D9CFCE",
                    subtext0 = "#D9D5C7",
                    subtext1 = "#BFBCB0",
                    blue = "#8DACE2",
                    green = "#A1CC85",
                    yellow = "#F2DEA6",
                    red = "#E67373",
                    lavander = "#DCB8E6",
                    teal = "#ABEDE4",
                    peach = "#EAAE6F",
                    sapphire = "#7ACCC1",
                },
            },
            integrations = {
                cmp = true,
                gitsigns = true,
                nvimtree = true,
                treesitter = true,
                notify = false,
                mini = {
                    enabled = true,
                    indentscope_color = "",
                },
            },
        })

        -- Apply the Catppuccin colorscheme
        vim.cmd.colorscheme("catppuccin")
    end,
}
