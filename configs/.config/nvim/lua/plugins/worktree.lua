-- ~/.config/nvim/lua/plugins/worktree.lua

return {
    "ThePrimeagen/git-worktree.nvim",
    config = function()
        require('git-worktree').setup()
    end
}
