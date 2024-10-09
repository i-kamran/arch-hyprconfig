-- ~/.config/nvim/lua/plugins/lualine.lua

return {
    "nvim-lualine/lualine.nvim",
    lazy = true,
    event = "VeryLazy",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
        local colors = {
            black = "#282a2e",
            white = "#E6DFCA",
            red = "#F77777",
            aqua = "#ABEDE4",
            yellow = "#EDD282",
            orange = "#E68A5C",
            gray = "#a89984",
            darkgray = "#3c3836",
            lightgray = "#504945",
            purple = "#DCB8E6",
        }

        -- Define your custom theme
        local custom_theme = {
            normal = {
                a = { bg = colors.purple, fg = colors.black, gui = "bold" },
                b = { bg = colors.lightgray, fg = colors.white },
                c = { bg = colors.darkgray, fg = colors.gray },
            },
            insert = {
                a = { bg = colors.yellow, fg = colors.black, gui = "bold" },
                b = { bg = colors.lightgray, fg = colors.white },
                c = { bg = colors.lightgray, fg = colors.white },
            },
            visual = {
                a = { bg = colors.orange, fg = colors.black, gui = "bold" },
                b = { bg = colors.lightgray, fg = colors.white },
                c = { bg = colors.darkgray, fg = colors.black },
            },
            replace = {
                a = { bg = colors.red, fg = colors.black, gui = "bold" },
                b = { bg = colors.lightgray, fg = colors.white },
                c = { bg = colors.black, fg = colors.white },
            },
            command = {
                a = { bg = colors.aqua, fg = colors.black, gui = "bold" },
                b = { bg = colors.lightgray, fg = colors.white },
                c = { bg = colors.darkgray, fg = colors.black },
            },
            inactive = {
                a = { bg = colors.darkgray, fg = colors.gray, gui = "bold" },
                b = { bg = colors.darkgray, fg = colors.gray },
                c = { bg = colors.darkgray, fg = colors.gray },
            },
        }

        -- Setup lualine with the custom theme
        require("lualine").setup({
            options = {
                theme = custom_theme,
            },
        })
    end,
}
