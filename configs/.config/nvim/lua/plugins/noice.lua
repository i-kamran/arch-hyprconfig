return {
	"folke/noice.nvim",
	event = "VeryLazy",
	opts = {
	},
	dependencies = {
		"MunifTanjim/nui.nvim",
		-- OPTIONAL:
		-- "rcarriga/nvim-notify",
	},
	require("noice").setup({
		routes = {
			{
				view = "notify",
				filter = { event = "msg_showmode" },
			},
		},
	}),
}
