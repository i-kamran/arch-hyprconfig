-- ~/.config/nvim/lua/plugins/mini.lua

return {
    "echasnovski/mini.nvim",
    config = function()
        require("mini.move").setup({
        })
    end,
}
