--------------------------------------------
--- ALL GENERAL KEYMAPS ARE DEFINED HERE ---
--- EXCEPTIONS:                          ---
--- 1. HARPOON                           ---
--- 2. TELESCOPE                         ---
--- 3. LSP (PARTIALLY DEFINED HERE)      ---
--- Specific keymaps for these are       ---
--- found in their respective            ---
--- configuration files.                 ---
--------------------------------------------

-- Leader Key Configuration
vim.g.mapleader = " "

-- General Keymaps
vim.keymap.set("n", "<leader><leader>", function()
    vim.cmd("so")
end)
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
vim.keymap.set("n", "<leader>res", "<cmd>LspRestart<CR>") -- Restart LSP
vim.keymap.set("i", "<C-c>", "<Esc>")
vim.keymap.set("n", "<leader>x", "<CMD>!chmod +x %<CR>", { silent = true })

-- Moving Lines in Visual Mode
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv") -- Move selected line down
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv") -- Move selected line up

-- Cursor Positioning Enhancements
vim.keymap.set("n", "J", "mzJ`z")       -- Join lines while maintaining cursor position
vim.keymap.set("n", "<C-d>", "<C-d>zz") -- Scroll down and center screen
vim.keymap.set("n", "<C-u>", "<C-u>zz") -- Scroll up and center screen
vim.keymap.set("n", "n", "nzzzv")       -- Search next and center screen
vim.keymap.set("n", "N", "Nzzzv")       -- Search previous and center screen

-- Clipboard and Deletion Keymaps
vim.keymap.set("x", "<leader>p", [["_dP]])          -- Paste over selection without overwriting register
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])  -- Yank to system clipboard
vim.keymap.set("n", "<leader>Y", [["+Y"]])          -- Yank entire line to system clipboard
vim.keymap.set({ "n", "v" }, "<leader>d", [["_d"]]) -- Delete without overwriting register

-- Quickfix Navigation
vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")     -- Next quickfix and center screen
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")     -- Previous quickfix and center screen
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz") -- Next location list and center screen
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz") -- Previous location list and center screen

-- Tmux Integration Keymaps
vim.keymap.set("n", "<C-t>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")
vim.keymap.set("n", "<C-h>", vim.cmd.NvimTmuxNavigateLeft)
vim.keymap.set("n", "<C-j>", vim.cmd.NvimTmuxNavigateDown)
vim.keymap.set("n", "<C-k>", vim.cmd.NvimTmuxNavigateUp)
vim.keymap.set("n", "<C-l>", vim.cmd.NvimTmuxNavigateRight)

-- Search and Replace
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]]) -- Replace word under cursor
vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, {})

-- Undo Tree Toggle
vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle)

-- Git Integration Keymaps
vim.keymap.set("n", "<leader>gs", vim.cmd.Git) -- Open Git status
vim.keymap.set("n", "<leader>gC", "<CMD>Git commit<CR>")
vim.keymap.set("n", "<leader>gt", "<CMD>Telescope git_branches<CR>")
vim.keymap.set("n", "<leader>gb", "<CMD>Gitsigns toggle_current_line_blame<CR>")
vim.keymap.set("n", "<leader>gB", "<CMD>Gitsigns preview_hunk<CR>")
vim.keymap.set("n", "<leader>gps", "<CMD>Git push<CR>")
vim.keymap.set("n", "<leader>gpl", "<CMD>Git pull<CR>")

-- LSP Keymaps
vim.keymap.set("n", "<C-f>", vim.lsp.buf.format)
vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, {})
vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, {})
vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})

-- Treesj
vim.keymap.set("n", "<leader>m", vim.cmd.TSJToggle)

-- Trouble
vim.keymap.set("n", "<leader>xz", "<CMD>Trouble diagnostics toggle<CR>")

-- flash
vim.keymap.set({ "n", "x", "o" }, "s", function()
    require("flash").jump()
end, { desc = "Flash" })

vim.keymap.set({ "n", "x", "o" }, "S", function()
    require("flash").treesitter()
end, { desc = "Flash Treesitter" })

-- Snippets
vim.keymap.set("n", "<leader>ee", "oif err != nil {<CR>}<Esc>Oreturn err<Esc>") -- Insert Go error handling snippet
vim.api.nvim_set_keymap('n', '<leader>nt', ':lua InsertYAMLTemplate()<CR>', { noremap = true, silent = true })
