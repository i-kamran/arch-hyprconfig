-- ~/.config/nvim/lua/plugins/visual.lua

return {
    -- undo tree
    {
        "mbbill/undotree",
    },

    -- trouble
    {
        "folke/trouble.nvim",
        lazy = true,
        event = "VeryLazy",
        opts = {}, -- for default options, refer to the configuration section for custom setup.
        cmd = "Trouble",
    },

    -- vim-illuminate
    {
        "RRethy/vim-illuminate",
        lazy = true,
        event = "VeryLazy",
    },

    -- indent-blankline
    {
        -- Add indentation guides even on blank lines
        "lukas-reineke/indent-blankline.nvim",
        -- Enable `lukas-reineke/indent-blankline.nvim`
        -- See `:help ibl`
        main = "ibl",
        opts = {},
        config = function()
            require("ibl").setup()
        end,
    },

    -- visual-multi
    {
        "mg979/vim-visual-multi",
        lazy = true,
        event = "VeryLazy",
        config = function()
            -- Disable specific key mappings for this plugin
            vim.g["VM_maps"] = {
                ["Goto Next"] = "",
                ["Goto Prev"] = "",
                ["Toggle Block"] = "",
            }
        end,
    },

    -- todo-comments
    {
        "folke/todo-comments.nvim",
        lazy = true,
        event = "VeryLazy",
        dependencies = { "nvim-lua/plenary.nvim" },
        opts = {
            -- your configuration comes here
            -- or leave it empty to use the default settings
        },
    },

    -- which-key
    {
        "folke/which-key.nvim",
        event = "VeryLazy",
        opts = {
            -- your configuration comes here
            -- or leave it empty to use the default settings
            -- refer to the configuration section below
        },
        keys = {
            {
                "<leader>?",
                function()
                    require("which-key").show({ global = false })
                end,
                desc = "Buffer Local Keymaps (which-key)",
            },
        },
    },

    -- highlight-colors
    {
        "brenoprata10/nvim-highlight-colors",
        config = function()
            require("cmp").setup({
                formatting = {
                    format = require("nvim-highlight-colors").format,
                },
            })
        end,
    },

    -- noice
    {
        "folke/noice.nvim",
        event = "VeryLazy",
        opts = {},
        dependencies = {
            "MunifTanjim/nui.nvim",
            -- OPTIONAL:
            -- "rcarriga/nvim-notify",
        },
        config = function()
            require("noice").setup({
                routes = {
                    {
                        view = "notify",
                        filter = { event = "msg_showmode" },
                        opts = {
                            timeout = 1000, -- Time in milliseconds; adjust as needed
                        },
                    },
                },
            })
        end,
    },

    -- lualine
    {
        "nvim-lualine/lualine.nvim",
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
    },

    -- catppuccin/nvim
    {
        "catppuccin/nvim",
        lazy = false,
        name = "catppuccin",
        priority = 1000,
        config = function()
            -- Define the custom palette
            -- local mocha = require("catppuccin.palettes").get_palette("mocha")

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
    },

    -- alpha-nvim
    {
        "goolord/alpha-nvim",
        dependencies = { "echasnovski/mini.icons" },
        config = function()
            local alpha = require("alpha")
            local dashboard = require("alpha.themes.dashboard")

            -- Set header
            dashboard.section.header.val = {
                "                                                     ",
                "  ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗ ",
                "  ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║ ",
                "  ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║ ",
                "  ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║ ",
                "  ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║ ",
                "  ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝ ",
                "                                                     ",
            }

            -- Set menu
            dashboard.section.buttons.val = {
                dashboard.button("e", "  > New file", ":ene <BAR> startinsert <CR>"),
                dashboard.button("f", "  > Find file", ":cd $HOME | Telescope find_files<CR>"),
                dashboard.button("r", "  > Recent", ":Telescope oldfiles<CR>"),
                dashboard.button("s", "  > Settings", ":e $MYVIMRC | :cd %:p:h | split . | wincmd k | pwd<CR>"),
                dashboard.button("n", "  > Today's note", "<cmd>ObsidianToday<CR>"),
            }

            alpha.setup(dashboard.opts)
        end,
    },
}
