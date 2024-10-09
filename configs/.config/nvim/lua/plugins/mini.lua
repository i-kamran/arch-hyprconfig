-- ~/.config/nvim/lua/plugins/mini.lua

return {
    "echasnovski/mini.nvim",
    lazy = true,
    event = "VeryLazy",
    config = function()
        require("mini.move").setup({})
    end,
}
