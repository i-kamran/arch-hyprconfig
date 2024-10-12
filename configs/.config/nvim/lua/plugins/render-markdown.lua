-- ~/.config/nvim/lua/plugins/render-markdown.lua

return {
    "MeanderingProgrammer/render-markdown.nvim",
    lazy = true,
    event = "VeryLazy",
    name = "render-markdown",
    dependencies = { "nvim-treesitter/nvim-treesitter", "echasnovski/mini.nvim" }, -- if you use the mini.nvim suite
    ---@module 'render-markdown'
    ---@type render.md.UserConfig
    opts = {},
}
