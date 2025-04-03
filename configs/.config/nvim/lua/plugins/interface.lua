-- ~/.config/nvim/lua/plugins/interface.lua

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

  -- noice
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    opts = {
      cmdline = {
        enabled = true,
      },
      messages = {
        enabled = false,
      },
      notify = {
        enabled = false,
      },
      -- lsp = {
      --   progress = { enabled = false },
      --   override = {
      --     ["vim.lsp.util.convert_input_to_markdown_lines"] = false,
      --     ["vim.lsp.util.stylize_markdown"] = ,
      --     ["cmp.entry.get_documentation"] = true,
      --   },
      -- },
      presets = {
        bottom_search = false, -- Disable bottom search
        command_palette = true, -- Enable floating command line
        long_message_to_split = false, -- Do not split long messages
      },
    },
    dependencies = {
      "MunifTanjim/nui.nvim",
      -- OPTIONAL:
      -- "rcarriga/nvim-notify",
    },
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
