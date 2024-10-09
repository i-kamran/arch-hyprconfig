-- ~/.config/nvim/lua/plugins/telescope.lua

return {
    "nvim-telescope/telescope.nvim",
    lazy = true,
    event = "VeryLazy",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
        require("telescope").setup({
            defaults = {
                layout_strategy = "horizontal",
                layout_config = {
                    horizontal = {
                        size = {
                            width = "95%",
                            height = "95%",
                        },
                        preview_width = 0.6,
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
        require("telescope").load_extension("ui-select")
        local builtin = require("telescope.builtin")

        ---------------
        --- KEYMAPS ---
        ---------------
        vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "[f]ind [f]iles" })
        vim.keymap.set("n", "<leader>fo", builtin.oldfiles, { desc = "[f]ind [o]ld" })
        vim.keymap.set("n", "<leader>fg", builtin.git_files, { desc = "[f]ind [g]it" })
        vim.keymap.set("n", "<leader>fG", builtin.live_grep, { desc = "[f]ind [g]rep" })
        vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "[f]ind [b]uffers" })
        vim.keymap.set("n", "<leader>fm", ":Telescope harpoon marks<CR>", { desc = "harpoon [m]arks" })
        vim.keymap.set("n", "<leader>fst", builtin.git_status, { desc = "[f]ind [st]atus" })
        vim.keymap.set("n", "<Leader>ft", ":Telescope git_worktree git_worktrees<CR>", { desc = "[f]ind [t]ree" })
        vim.keymap.set("n", "<Leader>fT", ":Telescope git_worktree create_git_worktree<CR>", { desc = "Create [t]ree" })
        vim.keymap.set("n", "<leader>fsg", function()
            builtin.grep_string({ search = vim.fn.input("Grep > ") })
        end, { desc = "[f]ind [s]tring" })
        vim.keymap.set("n", "<leader>fw", function()
            local word = vim.fn.expand("<cword>")
            builtin.grep_string({ search = word })
        end, { desc = "[f]ind [w]ord" })
        vim.keymap.set("n", "<leader>fW", function()
            local word = vim.fn.expand("<cWORD>")
            builtin.grep_string({ search = word })
        end, { desc = "[f]ind [W]ORD" })
    end,
}
