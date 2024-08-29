-- ~/.config/nvim/lua/set.lua

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

vim.opt.updatetime = 50
vim.opt.spelllang = "en_us"
vim.opt.spell = true

vim.cmd [[
  augroup ColorColumn
    autocmd!
    autocmd BufEnter * if &filetype != 'netrw' && &filetype != '' && &modifiable == 1 | setlocal colorcolumn=80 | else | setlocal colorcolumn=0 | endif
  augroup END
]]
vim.cmd [[
  augroup CommitMessageSettings
    autocmd!
    autocmd FileType gitcommit setlocal colorcolumn=50 spell spelllang=en_us
  augroup END
]]

vim.cmd [[
  augroup SpellChecking
    autocmd!
    " Enable spell checking for commit messages
    autocmd BufRead,BufNewFile COMMIT_EDITMSG setlocal spell spelllang=en_us
    autocmd FileType gitcommit setlocal spell spelllang=en_us

    " Enable spell checking for other specific filetypes (e.g., markdown)
    autocmd FileType markdown setlocal spell spelllang=en_us
  augroup END
]]
