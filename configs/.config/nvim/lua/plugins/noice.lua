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
  config = function()
	require("noice").setup({
		routes = {
			{
				view = "notify",
				filter = { event = "msg_showmode" },
                opts = {
						timeout = 10000,  -- Time in milliseconds; adjust as needed
					},
			},
		},
	})
end
}
