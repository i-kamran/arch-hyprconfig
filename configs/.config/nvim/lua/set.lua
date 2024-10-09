-- ~/.config/nvim/lua/set.lua

-- Leader Key Configuration
vim.g.mapleader = " "

vim.opt.guicursor = ""
vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.smartindent = true

vim.opt.wrap = false

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 200
vim.opt.spelllang = "en_us"
vim.opt.spell = true
vim.opt.conceallevel = 1 -- obsidian.nvim

vim.api.nvim_create_autocmd("BufEnter", {
	pattern = "*",
	callback = function()
		vim.cmd("highlight Visual guibg=#26403D")
	end,
})

local augroup_colorcolumn = vim.api.nvim_create_augroup("ColorColumn", { clear = true })
vim.api.nvim_create_autocmd("BufEnter", {
	group = augroup_colorcolumn,
	pattern = "*",
	callback = function()
		if
			vim.bo.filetype ~= "gitcommit"
			and vim.bo.filetype ~= "markdown"
			and vim.bo.filetype ~= "oil"
			and vim.bo.filetype ~= ""
			and vim.bo.modifiable
		then
			vim.opt.colorcolumn = "80"
		else
			vim.opt.colorcolumn = "0"
		end
	end,
})

local augroup_commit_spell = vim.api.nvim_create_augroup("CommitSpell", { clear = true })
vim.api.nvim_create_autocmd("FileType", {
	group = augroup_commit_spell,
	pattern = { "NeogitCommitMessage", "gitcommit" },
	callback = function()
		vim.opt.colorcolumn = "50"
		vim.opt.spell = true
	end,
})

vim.api.nvim_create_autocmd("BufEnter", {
	pattern = "*",
	callback = function()
		vim.cmd("highlight Comment guifg=#9f9f9f")
	end,
})

vim.api.nvim_create_autocmd("DiagnosticChanged", {
	callback = function()
		local current_bufnr = vim.api.nvim_get_current_buf()
		local diagnostics = vim.diagnostic.get(current_bufnr)
		local items = vim.diagnostic.toqflist(diagnostics)
		vim.fn.setloclist(0, items, "r")
	end,
})
