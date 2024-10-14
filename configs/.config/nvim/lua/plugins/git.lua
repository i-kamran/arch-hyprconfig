-- ~/.config/nvim/lua/plugins/git.lua

return {
    -- git-signs.nvim
	{
		"lewis6991/gitsigns.nvim",
		lazy = true,
		event = "VeryLazy",
		config = function()
			require("gitsigns").setup()
		end,
	},

    -- neogit
	{
		"NeogitOrg/neogit",
		lazy = true,
		event = "VeryLazy",
		dependencies = {
			"nvim-lua/plenary.nvim", -- required
			"sindrets/diffview.nvim", -- optional - Diff integration

			-- Only one of these is needed, not both.
			"nvim-telescope/telescope.nvim", -- optional
			"ibhagwan/fzf-lua", -- optional
		},
		config = true,
	},

    -- git-worktree
	{
		"ThePrimeagen/git-worktree.nvim",
		lazy = true,
		event = "VeryLazy",
		config = function()
			require("git-worktree").setup()
		end,
	},
}
