-- ~/.config/nvim/lua/plugins/markdown.lua

return {
    -- render-markdown.nvim
    {
        "MeanderingProgrammer/render-markdown.nvim",
        lazy = true,
        event = "VeryLazy",
        name = "render-markdown",
        dependencies = { "nvim-treesitter/nvim-treesitter", "echasnovski/mini.nvim" }, -- if you use the mini.nvim suite
        ---@module 'render-markdown'
        ---@type render.md.UserConfig
        opts = {},
    },

    -- bullets.vim
    {
        "bullets-vim/bullets.vim",
        event = "VeryLazy",
        config = function()
            -- Enable the plugin for specific file types
            vim.g.bullets_enabled_file_types = {
                "markdown",
                "text",
                "gitcommit",
                "scratch",
            }
        end,
    },

    -- markdown-preview
    {
        "iamcco/markdown-preview.nvim",
        lazy = true,
        event = "VeryLazy",
        cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
        build = "cd app && npm install",
        init = function()
            vim.g.mkdp_filetypes = { "markdown" }
        end,
        ft = { "markdown" },
    },

    -- obsidian.nvim
    {
        "epwalsh/obsidian.nvim",
        version = "*",
        lazy = false,
        dependencies = {
            "nvim-lua/plenary.nvim",
        },
        opts = {
            workspaces = {
                {
                    name = "private-notes",
                    path = "~/personal/private-notes",
                },
                {
                    name = "notes",
                    path = "~/personal/notes",
                },
            },
            templates = {
                folder = "~/personal/arch-hyprconfig/configs/.config/md-templates",
                date_format = "%Y-%m-%d",
                time_format = "%H:%M",
            },
            daily_notes = {
                folder = "daily",
                date_format = "%Y-%m-%d",
                alias_format = "%B %-d, %Y",
                default_tags = { "daily" },
                template = "daily.md",
            },
            attachments = {
                img_folder = "imgs",
            },
            ui = { enable = false },
        },
    },
}
