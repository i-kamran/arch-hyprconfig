-- ~/.config/nvim/lua/plugins/render-markdown.lua

return {
    "MeanderingProgrammer/render-markdown.nvim",
    lazy = true,
    event = "VeryLazy",
    opts = {},
    name = "render-markdown",
    dependencies = { "nvim-treesitter/nvim-treesitter", "echasnovski/mini.nvim" }, -- if you use the mini.nvim suite
}
