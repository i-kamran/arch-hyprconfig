-- ~/.config/nvim/lua/plugins/markdown.lua

return {
	-- render-markdown.nvim
	{
		"MeanderingProgrammer/render-markdown.nvim",
		lazy = true,
		event = "VeryLazy",
		name = "render-markdown",
		dependencies = { "nvim-treesitter/nvim-treesitter", "echasnovski/mini.nvim" }, -- if you use the mini.nvim suite
		---@module 'render-markdown'
		---@type render.md.UserConfig
		opts = {},
	},

	-- bullets.vim
	{
		"bullets-vim/bullets.vim",
        lazy = true,
		event = "VeryLazy",
		config = function()
			-- Enable the plugin for specific file types
			vim.g.bullets_enabled_file_types = {
				"markdown",
				"text",
				"gitcommit",
				"scratch",
			}
		end,
	},

	-- markdown-preview
	{
		"iamcco/markdown-preview.nvim",
		lazy = true,
		event = "VeryLazy",
		cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
		build = "cd app && npm install",
		init = function()
			vim.g.mkdp_filetypes = { "markdown" }
		end,
		ft = { "markdown" },
	},

	-- obsidian.nvim
	{
		"epwalsh/obsidian.nvim",
		version = "*",
		lazy = true,
        event = "VeryLazy",
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
				folder = "~/.config/md-templates",
				date_format = "%y-%m-%d",
				time_format = "%h:%m",
			},
			daily_notes = {
				folder = "daily",
				date_format = "%y-%m-%d",
				alias_format = "%b %-d, %y",
				default_tags = { "daily" },
				template = "daily.md",
			},
			attachments = {
				img_folder = "imgs",
				img_text_func = function(client, path)
					path = client:vault_relative_path(path) or path
                    local prefix = "../"
					return string.format("![%s](%s%s)", path.name, prefix, path)
				end,
			},
			ui = { enable = false },
		},
	},
}
