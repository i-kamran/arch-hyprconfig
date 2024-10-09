-- ~/.config/nvim/lua/plugins/worktree.lua

return {
    "ThePrimeagen/git-worktree.nvim",
    lazy = true,
    event = "VeryLazy",
    config = function()
        require('git-worktree').setup()
    end
}
