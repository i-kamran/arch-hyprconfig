-- ~/.config/nvim/lua/plugins/treesj.lua

return {
    "Wansmer/treesj",
    lazy = true,
    event = "VeryLazy",
    config = function()
        require("treesj").setup({
            use_default_keymaps = false,
        })
    end,
}
