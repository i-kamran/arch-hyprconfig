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
vim.opt.ignorecase = true
vim.opt.smartcase = true
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
-- vim.opt.spell = true
vim.opt.conceallevel = 1 -- obsidian.nvim

-- Set python3_host_prog to project venv if it exists, else fallback to global
local venv_path = vim.fn.getcwd() .. "/.venv/bin/python"
local global_python = vim.fn.expand("~/.venv/bin/python") -- or your preferred global path

if vim.fn.filereadable(venv_path) == 1 then
  vim.g.python3_host_prog = venv_path
else
  vim.g.python3_host_prog = global_python
end

vim.diagnostic.config({
  underline = true,
  virtual_text = true,
  signs = true,
  update_in_insert = false,
  severity_sort = true,
})

vim.api.nvim_create_autocmd("BufEnter", {
  pattern = "*",
  callback = function()
    vim.cmd("highlight Visual guibg=#26403D")
  end,
})

-- Terminal
vim.api.nvim_create_autocmd("TermOpen", {
  group = vim.api.nvim_create_augroup("custom-term-open", { clear = true }),
  callback = function()
    vim.opt.number = false
    vim.opt.relativenumber = false
  end,
})

vim.api.nvim_create_autocmd("TermOpen", {
  callback = function()
    vim.opt_local.spell = false
  end,
})

local augroup_colorcolumn = vim.api.nvim_create_augroup("ColorColumn", { clear = true })
vim.api.nvim_create_autocmd({ "BufEnter", "FileType" }, {
  group = augroup_colorcolumn,
  pattern = "*",
  callback = function()
    local excluded_filetypes = {
      gitcommit = true,
      markdown = true,
      terminal = true,
      oil = true,
      harpoon = true,
      netrw = true,
      [""] = true,
    }
    if not excluded_filetypes[vim.bo.filetype] and vim.bo.modifiable then
      vim.opt_local.colorcolumn = "80"
    else
      vim.opt_local.colorcolumn = "0"
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
    for i, item in ipairs(items) do
      if diagnostics[i].source then
        item.text = "[" .. diagnostics[i].source .. "] " .. item.text
      end
    end
    vim.fn.setloclist(0, items, "r")
  end,
})

vim.api.nvim_create_user_command("MarkdownTOC", function()
  local bufnr = vim.api.nvim_get_current_buf()
  local filename = vim.api.nvim_buf_get_name(bufnr)
  -- Run markdown-toc on the current buffer
  vim.fn.system(string.format("markdown-toc -i %s", filename))
  -- Optionally, you can reload the buffer to see changes
  vim.cmd("edit")
end, {})

local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })

-- Add additional events to trigger linting dynamically
vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost" }, {
  group = lint_augroup,
  callback = function()
    require("lint").try_lint()
  end,
})

-- 2-space indentation
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "java", "html", "css", "javascript", "typescript", "lua", "json" },
  callback = function()
    vim.opt_local.tabstop = 2
    vim.opt_local.shiftwidth = 2
    vim.opt_local.expandtab = true
  end,
})

