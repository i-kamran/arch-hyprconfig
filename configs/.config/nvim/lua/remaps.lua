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

-- General Keymaps
vim.keymap.set("n", "<leader>src", function() vim.cmd("so") end, { desc = "[s]ou[rc]e" })
vim.keymap.set("n", "<leader>nw", vim.cmd.Ex, { desc = "[n]etr[w]" })
vim.keymap.set("n", "<leader>re", "<cmd>LspRestart<CR>", { desc = "[re]start LSP" })
vim.keymap.set("i", "<C-c>", "<Esc>")
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { desc = "e[x]ecutable" })
vim.keymap.set("n", "QQ", "<cmd>q!<CR>", { noremap = false })
vim.keymap.set("n", "WW", "<cmd>w!<CR>", { noremap = false })

-- Moving Lines in Visual Mode
vim.keymap.set("v", "J", "<cmd>m '>+1<CR>gv=gv", { desc = "move line down" })
vim.keymap.set("v", "K", "<cmd>m '<-2<CR>gv=gv", { desc = "move line up" })

-- Cursor Positioning Enhancements
vim.keymap.set("n", "J", "mzJ`z", { desc = "join lines, maintains cursor position" })
vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "scroll down and center screen" })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "scroll up and center screen" })
vim.keymap.set("n", "n", "nzzzv", { desc = "search next and center screen" })
vim.keymap.set("n", "N", "Nzzzv", { desc = "search previous and center screen" })
vim.keymap.set("n", "E", "$", { noremap = false, desc = "move to end of line" })
vim.keymap.set("n", "B", "^", { noremap = false, desc = "move to beginning of line" })

-- Clipboard and Deletion Keymaps
vim.keymap.set("x", "<leader>p", [["_dP]], { desc = "[p]aste over" }) -- without overwriting register"
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]], { desc = "[y]ank to clipboard" })
vim.keymap.set("n", "<leader>Y", [["+Y]], { desc = "[Y]ank line to clipboard" })
vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]], { desc = "[d]elete over" }) --  without overwriting register

-- Quickfix Navigation
vim.keymap.set("n", "<C-qk>", "<cmd>cnext<CR>zz", { desc = "next quickfix" })
vim.keymap.set("n", "<C-qj>", "<cmd>cprev<CR>zz", { desc = "previous quickfix" })
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz", { desc = "next location list" })
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz", { desc = "previous location list" })

-- Tmux Integration Keymaps
vim.keymap.set("n", "<C-t>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")
vim.keymap.set("n", "<C-h>", vim.cmd.NvimTmuxNavigateLeft)
vim.keymap.set("n", "<C-j>", vim.cmd.NvimTmuxNavigateDown)
vim.keymap.set("n", "<C-k>", vim.cmd.NvimTmuxNavigateUp)
vim.keymap.set("n", "<C-l>", vim.cmd.NvimTmuxNavigateRight)

-- Search and Replace
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], { desc = "replace under curson" })
vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { desc = "[r]e[n]ame" })

-- Undo Tree Toggle
vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle, { desc = "[u]ndo tree" })

-- Git Integration Keymaps
vim.keymap.set("n", "<leader>gs", vim.cmd.Git, { desc = "[g]it [s]tatus" })
vim.keymap.set("n", "<leader>gC", "<cmd>Git commit<CR>", { desc = "[g]it [c]ommit" })
vim.keymap.set("n", "<leader>gt", "<cmd>Telescope git_branches<CR>", { desc = "[g]it [t]elescope branches" })
vim.keymap.set("n", "<leader>gb", "<cmd>Gitsigns toggle_current_line_blame<CR>", { desc = "[g]it [b]lame" })
vim.keymap.set("n", "<leader>gph", "<cmd>Gitsigns preview_hunk<CR>", { desc = "[g]it [p]review [h]unk" })
vim.keymap.set("n", "<leader>gps", "<cmd>Git push<CR>", { desc = "[g]it [p]u[s]h" })
vim.keymap.set("n", "<leader>gpl", "<cmd>Git pull<CR>", { desc = "[g]it [p]u[l]l" })

-- LSP Keymaps
vim.keymap.set("n", "<A-f>", vim.lsp.buf.format)
vim.keymap.set("n", "K", vim.lsp.buf.hover)
vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, { desc = "[g]o to [d]efinition" })
vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, { desc = "[g]o to [r]eferences" })
vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "[c]ode [a]ction" })

-- Treesj
vim.keymap.set("n", "<leader>tj", vim.cmd.TSJToggle, { desc = "[t]rees[j]" })

-- Trouble
vim.keymap.set("n", "<leader>tx", "<cmd>Trouble diagnostics toggle<CR>", { desc = "[t]rouble" })

-- flash
vim.keymap.set({ "n", "x", "o" }, "s", function()
	require("flash").jump()
end, { desc = "Flash" })

vim.keymap.set({ "n", "x", "o" }, "S", function()
	require("flash").treesitter()
end, { desc = "Flash Treesitter" })

-- Snippets
vim.keymap.set("n", "<leader>ee", "oif err != nil {<CR>}<Esc>Oreturn err<Esc>", { desc = "[e]rror" }) -- Insert Go error handling snippet
vim.api.nvim_set_keymap("n", "<leader>nt", ":lua InsertYAMLTemplate()<CR>", { desc = "[n]ote [t]emplate" })
