-- ~/.config/nvim/lua/plugins/telescope.lua

return {
	"nvim-telescope/telescope.nvim",
	dependencies = { "nvim-lua/plenary.nvim" },
	config = function()
		require("telescope").setup({
			defaults = {
				layout_strategy = "horizontal",
				layout_config = {
					preview_width = 0.6,
					horizontal = {
						size = {
							width = "95%",
							height = "95%",
						},
					},
				},
				pickers = {
					find_files = {
						theme = "dropdown",
					},
				},
				mappings = {
					i = {
						["<C-j>"] = require("telescope.actions").move_selection_next,
						["<C-k>"] = require("telescope.actions").move_selection_previous,
					},
				},
			},
		})
		-- Enable telescope fzf native, if installed
		pcall(require("telescope").load_extension, "fzf")

		require("telescope").load_extension("git_worktree")
		require("telescope").load_extension("harpoon")
		local builtin = require("telescope.builtin")

		---------------
		--- KEYMAPS ---
		---------------
		vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "[F]ind [F]iles" })
		vim.keymap.set("n", "<leader>fo", builtin.oldfiles, { desc = "[F]ind [O]ld" })
		vim.keymap.set("n", "<leader>fg", builtin.git_files, { desc = "[F]ind [G]it" })
		vim.keymap.set("n", "<leader>fG", builtin.live_grep, { desc = "[F]ind [G]rep" })
		vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "[F]ind [B]uffers" })
		vim.keymap.set("n", "<leader>fm", ":Telescope harpoon marks<CR>", { desc = "Harpoon [M]arks" })
		vim.keymap.set("n", "<leader>fst", builtin.git_status, { desc = "[F]ind [S][T]atus" })
		vim.keymap.set("n", "<Leader>ft", ":Telescope git_worktree git_worktrees<CR>", { desc = "[F]ind [T]ree" })
		vim.keymap.set("n", "<Leader>fT", ":Telescope git_worktree create_git_worktree<CR>", { desc = "Create [T]ree" })
		vim.keymap.set("n", "<leader>fsg", function()
			builtin.grep_string({ search = vim.fn.input("Grep > ") })
		end, { desc = "[F]ind [S]tring" })
		vim.keymap.set("n", "<leader>fw", function()
			local word = vim.fn.expand("<cword>")
			builtin.grep_string({ search = word })
		end, { desc = "[F]ind [W]ord" })
		vim.keymap.set("n", "<leader>fW", function()
			local word = vim.fn.expand("<cWORD>")
			builtin.grep_string({ search = word })
		end, { desc = "[F]ind [W]ORD" })
	end,
}
