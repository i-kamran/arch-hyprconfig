-- ~/.config/nvim/lua/plugins/git-signs.lua

return {
    "lewis6991/gitsigns.nvim",
    lazy = true,
    event = "VeryLazy",
    config = function()
        require("gitsigns").setup()
    end,
}
