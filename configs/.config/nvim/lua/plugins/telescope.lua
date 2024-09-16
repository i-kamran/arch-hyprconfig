-- ~/.config/nvim/lua/plugins/telescope.lua

return {
    "nvim-telescope/telescope.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
        require("telescope").setup({})

        local builtin = require("telescope.builtin")

        ---------------
        --- KEYMAPS ---
        ---------------
        vim.keymap.set("n", "<leader>ff", builtin.find_files, {desc = '[F]ind files'})
        vim.keymap.set("n", "<leader>fg", builtin.git_files, {desc = '[F]ind git'})
        vim.keymap.set("n", "<leader>fG", builtin.live_grep, {desc = '[F]ind grep'})
        vim.keymap.set("n", "<leader>fb", builtin.buffers, {desc = '[F]ind buffers'})
        vim.keymap.set("n", "<leader>fsg", function()
            builtin.grep_string({ search = vim.fn.input("Grep > ") })
        end, {desc = '[F]ind string'})
        vim.keymap.set("n", "<leader>fws", function()
            local word = vim.fn.expand("<cword>")
            builtin.grep_string({ search = word })
        end, {desc = '[F]ind word'})
        vim.keymap.set("n", "<leader>fWs", function()
            local word = vim.fn.expand("<cWORD>")
            builtin.grep_string({ search = word })
        end, {desc = "[F]ind WORD"})
    end,
}
