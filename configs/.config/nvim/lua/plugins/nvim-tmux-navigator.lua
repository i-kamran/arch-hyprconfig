-- ~/.config/nvim/lua/plugins/nvim-tmux-navigator.lua

return {
    "alexghergh/nvim-tmux-navigation",
    lazy = true,
    event = "VeryLazy",
    config = function()
        require("nvim-tmux-navigation").setup({})
    end,
}
