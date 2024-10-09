-- ~/.config/nvim/lua/plugins/git-signs.lua

return {
    "lewis6991/gitsigns.nvim",

    config = function()
        require('gitsigns').setup()
    end
}
