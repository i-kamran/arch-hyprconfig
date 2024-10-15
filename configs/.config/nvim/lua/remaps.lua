--------------------------------------------
--- ALL GENERAL KEYMAPS ARE DEFINED HERE ---
--- EXCEPTIONS:                          ---
--- 1. LSP (PARTIALLY DEFINED HERE)      ---
--- Specific keymaps for these are       ---
--- found in their respective            ---
--- configuration files.                 ---
--------------------------------------------

-- General Keymaps
vim.keymap.set("n", "<leader><leader>", function() vim.cmd("so") end, { desc = "source" })
vim.keymap.set("n", "<leader>oi", "<cmd>Oil<CR>", { desc = "[oi]l" })
vim.keymap.set("i", "<C-c>", "<Esc>")
vim.keymap.set("i", "<C-j>", "<Esc>")
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { desc = "e[x]ecutable" })
vim.keymap.set("n", "<leader>we", "<cmd>q!<CR>", { noremap = false })
vim.keymap.set("n", "<leader>ww", "<cmd>w<CR>", { noremap = false })
vim.keymap.set("n", "<leader>wq", "<cmd>wq<CR>", { noremap = false })
vim.keymap.set("i", "<C-l>", "<C-o>dl")
vim.keymap.set("i", "<C-q>", "<C-o>dw")

-- Moving Lines in Visual Mode
-- vim.keymap.set("v", "J", "<cmd>m '>+1<CR>gv=gv", { desc = "move line down" })
-- vim.keymap.set("v", "K", "<cmd>m '<-2<CR>gv=gv", { desc = "move line up" })

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

-- Quickfix and Location lists Navigation
vim.keymap.set("n", "<leader>lo", "<cmd>lopen<CR>zz", { desc = "[l]ocation [o]pen" })
vim.keymap.set("n", "<leader>lc", "<cmd>lclose<CR>zz", { desc = "[l]ocation [c]lose" })
vim.keymap.set("n", "<leader>lk", "<cmd>lnext<CR>zz", { desc = "[l]ocation next" })
vim.keymap.set("n", "<leader>lj", "<cmd>lprev<CR>zz", { desc = "[l]ocation prev" })
vim.keymap.set("n", "<leader>qo", "<cmd>copen<CR>", { desc = "[q]uickfix [o]pen" })
vim.keymap.set("n", "<leader>qc", "<cmd>cclose<CR>", { desc = "[q]uickfix [c]lose" })
vim.keymap.set("n", "<leader>qk", "<cmd>cprev<CR>", { desc = "[q]uickfix prev" })
vim.keymap.set("n", "<leader>qj", "<cmd>cnext<CR>", { desc = "[q]uickfix next" })

-- Tmux Integration Keymaps
vim.keymap.set("n", "<C-t>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")
vim.keymap.set("n", "<C-h>", vim.cmd.NvimTmuxNavigateLeft)
vim.keymap.set("n", "<C-j>", vim.cmd.NvimTmuxNavigateDown)
vim.keymap.set("n", "<C-k>", vim.cmd.NvimTmuxNavigateUp)
vim.keymap.set("n", "<C-l>", vim.cmd.NvimTmuxNavigateRight)

-- Search and Replace
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], { desc = "replace under curson" })

-- Undo Tree Toggle
vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle, { desc = "[u]ndo tree" })

-- Git Integration Keymaps
vim.keymap.set("n", "<leader>gs", vim.cmd.Neogit, { desc = "[g]it [s]tatus" })
vim.keymap.set("n", "<leader>gC", "<cmd>Git commit<CR>", { desc = "[g]it [c]ommit" })
vim.keymap.set("n", "<leader>gt", "<cmd>Telescope git_branches<CR>", { desc = "[g]it [t]elescope branches" })
vim.keymap.set("n", "<leader>gb", "<cmd>Gitsigns toggle_current_line_blame<CR>", { desc = "[g]it [b]lame" })
vim.keymap.set("n", "<leader>gph", "<cmd>Gitsigns preview_hunk<CR>", { desc = "[g]it [p]review [h]unk" })
vim.keymap.set("n", "<leader>gps", "<cmd>Neogit push<CR>", { desc = "neo[g]it [p]u[s]h" })
vim.keymap.set("n", "<leader>gpl", "<cmd>Neogit pull<CR>", { desc = "neo[g]it [p]u[l]l" })

-- LSP Keymaps
vim.keymap.set("n", "<A-f>", vim.lsp.buf.format)
vim.keymap.set("n", "K", vim.lsp.buf.hover)
vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { desc = "[r]e[n]ame" })
vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, { desc = "[g]o to [d]efinition" })
vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, { desc = "[g]o to [r]eferences" })
vim.keymap.set("n", "<leader>ga", vim.lsp.buf.code_action, { desc = "[g]o code [a]ction" })
vim.keymap.set("n", "<leader>gD", vim.lsp.buf.declaration, { desc = "[g]o to [D]eclaration" })
vim.keymap.set("n", "<leader>gt", vim.lsp.buf.type_definition, { desc = "[g]o to [t]ype definition" })
--
vim.keymap.set("n", "<leader>lf", vim.diagnostic.open_float, { desc = "diagnostic [f]loat" })
vim.keymap.set("n", "<leader>ll", vim.diagnostic.setloclist, { desc = "diagnostics [l]ist" })
vim.keymap.set("n", "<leader>lr", "<cmd>LspRestart<CR>", { desc = "[l]sp [r]estart" })
vim.keymap.set("n", "<leader>ls", "<cmd>LspStart<CR>", { desc = "[l]sp [s]tart" })
vim.keymap.set("n", "<leader>li", vim.lsp.buf.signature_help, { desc = "[L]SP s[i]gnature" })
vim.keymap.set("n", "<leader>lm", vim.lsp.buf.document_symbol, { desc = "[L]SP sy[m]bols in document" })
vim.keymap.set("n", "<leader>lw", vim.lsp.buf.workspace_symbol, { desc = "[L]SP [w]orkspace symbols" })

-- Markdown
vim.keymap.set("n", "<leader>mt", "<cmd>MarkdownPreviewToggle<CR>", { desc = "[m]arkdown [t]oggle" })
vim.keymap.set("n", "<leader>mg", "<cmd>ObsidianTemplate general<CR>", { desc = "[m]arkdown [g]eneral" })
vim.keymap.set("n", "<leader>md", "<cmd>ObsidianToday<CR>", { desc = "[m]arkdown to[d]ay" })
vim.keymap.set("n", "<leader>mr", "<cmd>ObsidianTomorrow<CR>", { desc = "[m]arkdown tomo[r]row" })
vim.keymap.set("n", "<leader>mi", "<cmd>ObsidianPasteImg<CR>", { desc = "[m]arkdown [i]mage" })
vim.keymap.set('n', '<leader>mc', '<cmd>w<CR><cmd>!markdown-toc -i %<CR>', { desc = "[m]arkdown to[c]"})

-- Treesj
vim.keymap.set("n", "<leader>tj", vim.cmd.TSJToggle, { desc = "[t]rees[j]" })

-- Trouble
vim.keymap.set("n", "<leader>tx", "<cmd>Trouble diagnostics toggle<CR>", { desc = "[t]rouble" })

-- Flash
vim.keymap.set({ "n", "x", "o" }, "s", function() require("flash").jump() end, { desc = "Flash" })
vim.keymap.set({ "n", "x", "o" }, "S", function() require("flash").treesitter() end, { desc = "Flash Treesitter" })

-- Snippets
vim.keymap.set("n", "<leader>ee", "oif err != nil {<CR>}<Esc>Oreturn err<Esc>", { desc = "[e]rror" }) -- Insert Go error handling snippet

-- DAP
vim.keymap.set('n', '<F2>', require('dap').continue)
vim.keymap.set('n', '<F3>', require('dap').step_over)
vim.keymap.set('n', '<F4>', require('dap').step_into)
vim.keymap.set('n', '<F5>', require('dap').step_out)
vim.keymap.set('n', '<leader>b', require('dap').toggle_breakpoint)

-- Telescope
vim.keymap.set("n", "<leader>ff", require("telescope.builtin").find_files, { desc = "[f]ind [f]iles" })
vim.keymap.set("n", "<leader>fo", require("telescope.builtin").oldfiles, { desc = "[f]ind [o]ld" })
vim.keymap.set("n", "<leader>fg", require("telescope.builtin").git_files, { desc = "[f]ind [g]it" })
vim.keymap.set("n", "<leader>fG", require("telescope.builtin").live_grep, { desc = "[f]ind [g]rep" })
vim.keymap.set("n", "<leader>fb", require("telescope.builtin").buffers, { desc = "[f]ind [b]uffers" })
vim.keymap.set("n", "<leader>fm", ":Telescope harpoon marks<CR>", { desc = "harpoon [m]arks" })
vim.keymap.set("n", "<leader>fst", require("telescope.builtin").git_status, { desc = "[f]ind [st]atus" })
vim.keymap.set("n", "<Leader>ft", ":Telescope git_worktree git_worktrees<CR>", { desc = "[f]ind [t]ree" })
vim.keymap.set("n", "<Leader>fT", ":Telescope git_worktree create_git_worktree<CR>", { desc = "Create [t]ree" })
vim.keymap.set("n", "<leader>fsg", function() require("telescope.builtin").grep_string({ search = vim.fn.input("Grep > ") }) end, { desc = "[f]ind [s]tring" })
vim.keymap.set("n", "<leader>fw", function() local word = vim.fn.expand("<cword>") require("telescope.builtin").grep_string({ search = word }) end, { desc = "[f]ind [w]ord" })
vim.keymap.set("n", "<leader>fW", function() local word = vim.fn.expand("<cWORD>") require("telescope.builtin").grep_string({ search = word }) end, { desc = "[f]ind [W]ORD" })

-- Harpoon
vim.keymap.set("n", "<A-a>", function() require("harpoon"):list():add() end, { desc = "[a]dd harpoon" })
vim.keymap.set("n", "<A-e>", function() require("harpoon").ui:toggle_quick_menu(require("harpoon"):list()) end)
vim.keymap.set("n", "<A-1>", function() require("harpoon"):list():select(1) end)
vim.keymap.set("n", "<A-2>", function() require("harpoon"):list():select(2) end)
vim.keymap.set("n", "<A-3>", function() require("harpoon"):list():select(3) end)
vim.keymap.set("n", "<A-4>", function() require("harpoon"):list():select(4) end)
vim.keymap.set("n", "<A-5>", function() require("harpoon"):list():select(5) end)
-- Toggle previous & next buffers stored within Harpoon list
vim.keymap.set("n", "<A-S-P>", function() require("harpoon"):list():prev() end)
vim.keymap.set("n", "<A-S-N>", function() require("harpoon"):list():prev() end)
vim.keymap.set("n", "<leader>A-1>", function() require("harpoon"):list():replace_at(1) end)
vim.keymap.set("n", "<leader>A-2>", function() require("harpoon"):list():replace_at(2) end)
vim.keymap.set("n", "<leader>A-3>", function() require("harpoon"):list():replace_at(3) end)
vim.keymap.set("n", "<leader>A-4>", function() require("harpoon"):list():replace_at(4) end)
vim.keymap.set("n", "<leader>A-5>", function() require("harpoon"):list():replace_at(5) end)
