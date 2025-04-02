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

  -- harpoon
  {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    lazy = true,
    event = "VeryLazy",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      local harpoon = require("harpoon")
      -- REQUIRED
      harpoon:setup()
      -- REQUIRED
    end,
  },

  -- telescope

  {
    {
      "nvim-telescope/telescope.nvim",
      lazy = true,
      event = "VeryLazy",
      dependencies = { "nvim-lua/plenary.nvim" },
      config = function()
        require("telescope").setup({
          defaults = {
            layout_strategy = "horizontal",
            layout_config = {
              horizontal = {
                size = {
                  width = "95%",
                  height = "95%",
                },
                preview_width = 0.6,
              },
            },
            file_ignore_patterns = { "node_modules", ".git/" }, -- Exclude clutter
            vimgrep_arguments = {
              "rg",
              "--color=never",
              "--no-heading",
              "--with-filename",
              "--line-number",
              "--column",
              "--smart-case", -- Case insensitive unless uppercase is used
              "--hidden", -- Search hidden files
              "--glob=!{.git,node_modules}/*", -- Exclude .git and node_modules
            },
            pickers = {
              find_files = {
                theme = "dropdown",
                find_command = { "fd", "--type", "f", "--hidden", "--strip-cwd-prefix" }, -- Better file searching
              },
            },
            live_grep = {
              only_sort_text = true, -- Allow partial matches
            },
            mappings = {
              i = {
                ["<C-j>"] = require("telescope.actions").move_selection_next,
                ["<C-k>"] = require("telescope.actions").move_selection_previous,
              },
            },
          },
        })
        -- Enable telescope fzf native, if installed
        pcall(require("telescope").load_extension, "fzf")

        require("telescope").load_extension("git_worktree")
        require("telescope").load_extension("harpoon")
        require("telescope").load_extension("ui-select")
      end,
    },

    -- telescope-ui
    {
      "nvim-telescope/telescope-ui-select.nvim",
      lazy = true,
      event = "VeryLazy",
      config = function()
        require("telescope").setup({
          extensions = {
            ["ui-select"] = {
              require("telescope.themes").get_dropdown({}),
            },
          },
        })
        require("telescope").load_extension("ui-select")
      end,
    },
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
