-- ~/.config/nvim/lua/plugins/comment-nvim.lua

return {
    "numToStr/Comment.nvim",
    lazy = true,
    event = "VeryLazy",
    config = function()
        require("Comment").setup()
    end,
}
