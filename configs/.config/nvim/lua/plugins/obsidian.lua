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
		},
		daily_notes = {
			folder = "daily",
			date_format = "%Y-%m-%d",
		},
		note_id_func = function(title)
			-- Use the date as the ID for daily notes
			return os.date("%Y-%m-%d")
		end,
	},
	config = function(_, opts)
		require("obsidian").setup(opts)

		local date = os.date("%Y-%m-%d")
		local year = tostring(os.date("%Y"))
		local month = tostring(os.date("%m"))
		local daily_note_path = string.format("~/personal/private-notes/daily/%s.md", date)
		local table_content = [[
|  Start  | Task | Status |
| ------- | ---- | ------ |
| 6am     |      |        |
| 8am     |      |        |
| 8.30am  |      |        |
| 12.30pm |      |        |
| 1pm     |      |        |
| 3pm     |      |        |
| 4pm     |      |        |
| 6.30pm  |      |        |
| 7.30pm  |      |        |
<!-- Use &check; and &cross; for status or simply + and - -->

### Notes

### Misc
]]
		-- Create custom command 'Nd' for daily notes
		vim.api.nvim_create_user_command("Nd", function()
			-- Check if the file already exists
			if vim.fn.filereadable(vim.fn.expand(daily_note_path)) == 1 then
				-- If it exists, open it
				vim.cmd("edit " .. daily_note_path)
			else
				-- If it doesn't exist, create it with the specified content
				local content =
					string.format("---\ntags:\n    - daily-%s\n    - daily-%s\n---\n%s", year, month, table_content)
				local file = io.open(vim.fn.expand(daily_note_path), "w")
				if file then
					file:write(content)
					file:close()
					vim.cmd("edit " .. daily_note_path)
				else
					print("Error: Unable to create the daily note file.")
				end
			end
		end, {})
	end,
}
