-- ~/.config/nvim/lua/plugins/comment-nvim.lua

return {
    "numToStr/Comment.nvim",
    config = function()
        require("Comment").setup()
    end,
}

