-- ~/.config/nvim/lua/plugins/edit.lua
-- Plugins for automated text editing

return {
  -- Comment.nvim
  {
    "numToStr/Comment.nvim",
    lazy = true,
    event = "VeryLazy",
    config = function()
      require("Comment").setup()
    end,
  },

  -- nvim-autotag
  {
    "windwp/nvim-ts-autotag",
    lazy = true,
    event = "VeryLazy",
    config = function()
      require("nvim-ts-autotag").setup({})
    end,
  },

  -- visual-multi
  {
    "mg979/vim-visual-multi",
    lazy = true,
    event = "VeryLazy",
    config = function()
      vim.g.VM_show_warnings = 0
      -- Disable specific key mappings for this plugin
      vim.g["VM_maps"] = {
        ["Goto Next"] = "",
        ["Goto Prev"] = "",
        -- ["Toggle Block"] = "",
      }
    end,
  },

  -- nvim-autopairs
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    config = true,
  },

  -- "treesj"
  {
    "Wansmer/treesj",
    lazy = true,
    event = "VeryLazy",
    config = function()
      require("treesj").setup({
        use_default_keymaps = false,
      })
    end,
  },

  -- nvim-surround
  {
    "kylechui/nvim-surround",
    config = function()
      require("nvim-surround").setup({ version = "*", event = "VeryLazy", opts = {} })
    end,
  },

  -- refactoring
  {
    "ThePrimeagen/refactoring.nvim",
    lazy = true,
    event = "VeryLazy",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
    },
    config = function()
      require("refactoring").setup()
    end,
  },
}
