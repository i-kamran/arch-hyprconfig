-- ~/.config/nvim/lua/plugins/nvim-surround.lua

return {
    "kylechui/nvim-surround",
    lazy = true,
    event = "VeryLazy",
    config = function()
        require("nvim-surround").setup({ version = "*", event = "VeryLazy", opts = {} })
    end,
}
