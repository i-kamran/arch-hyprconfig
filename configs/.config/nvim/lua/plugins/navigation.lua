-- ~/.config/nvim/lua/plugins/navigation.lua

return {
    -- bqf - better quick fix
    {
        "kevinhwang91/nvim-bqf",
        event = "VeryLazy",
        opts = {},
    },

    -- oil
    {
        "stevearc/oil.nvim",
        ---@module 'oil'
        ---@type oil.SetupOpts
        opts = {},
        -- Optional dependencies
        dependencies = { { "echasnovski/mini.icons", opts = {} } },
        -- dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if prefer nvim-web-devicons
        config = function()
            require("oil").setup({
                columns = {
                    "icon",
                    "size",
                },
                view_options = {
                    -- Show files and directories that start with "."
                    show_hidden = true,
                },
                win_options = {
                    wrap = false,
                    signcolumn = "no",
                    cursorcolumn = false,
                    foldcolumn = "0",
                    spell = false,
                    list = false,
                    conceallevel = 0,
                    concealcursor = "nvic",
                },
            })
        end,
    },

    -- flash
    {
        "folke/flash.nvim",
        event = "VeryLazy",
        ---@type Flash.Config
        opts = {},
    },

    --fzf-lua
    {
        "ibhagwan/fzf-lua",
        lazy = true,
        event = "VeryLazy",
        -- optional for icon support
        dependencies = { "nvim-tree/nvim-web-devicons" },
        config = function()
            -- calling `setup` is optional for customization
            require("fzf-lua").setup({})
        end,
    },

    -- nvim-tmux-navigation
    {
        "alexghergh/nvim-tmux-navigation",
        lazy = true,
        event = "VeryLazy",
        config = function()
            require("nvim-tmux-navigation").setup({})
        end,
    },
}
