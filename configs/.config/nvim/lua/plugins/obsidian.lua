return {
	"epwalsh/obsidian.nvim",
	version = "*",
	lazy = false,
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	opts = {
		workspaces = {
			{
				name = "private-notes",
				path = "~/personal/private-notes",
			},
			{
				name = "notes",
				path = "~/personal/notes",
			},
		},
		templates = {
			folder = "~/personal/arch-hyprconfig/configs/.config/md-templates",
			date_format = "%Y-%m-%d",
			time_format = "%H:%M",
		},
		daily_notes = {
			folder = "daily",
			date_format = "%Y-%m-%d",
			alias_format = "%B %-d, %Y",
			default_tags = { "daily" },
			template = "daily.md",
		},
		attachments = {
			img_folder = "imgs",
		},
	},
}
