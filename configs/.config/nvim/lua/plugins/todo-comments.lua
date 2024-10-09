-- ~/.config/nvim/lua/plugins/todo-comments.lua

return {
    "folke/todo-comments.nvim",
    lazy = true,
    event = "VeryLazy",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {
        -- your configuration comes here
        -- or leave it empty to use the default settings
    },
}
