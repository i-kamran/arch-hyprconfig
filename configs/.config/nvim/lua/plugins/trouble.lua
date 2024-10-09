-- ~/.config/nvim/lua/plugins/trouble.lua

return {
    "folke/trouble.nvim",
    lazy = true,
    event = "VeryLazy",
    opts = {}, -- for default options, refer to the configuration section for custom setup.
    cmd = "Trouble",
}
