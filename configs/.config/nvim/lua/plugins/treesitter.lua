-- ~/.config/nvim/lua/plugins/treesitter.lua

return {
  "nvim-treesitter/nvim-treesitter",
  branch = "main",
  build = ":TSUpdate",
  init = function()
    vim.api.nvim_create_autocmd("FileType", {
      callback = function()
        pcall(vim.treesitter.start)
        vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
        vim.wo.foldmethod = "expr"
        vim.wo.foldexpr = "v:lua.vim.treesitter.foldexpr()"
        vim.wo.foldenable = false
      end,
    })
  end,
  config = function()
    local installed = require("nvim-treesitter.config").get_installed()
    local wanted = {
      "c",
      "lua",
      "vim",
      "vimdoc",
      "query",
      "javascript",
      "html",
      "python",
      "markdown",
      "markdown_inline",
      "bash",
      "json",
      "toml",
      "gitcommit"
    }
    local to_install = vim.tbl_filter(function(p)
      return not vim.tbl_contains(installed, p)
    end, wanted)
    if #to_install > 0 then
      require("nvim-treesitter").install(to_install)
    end
  end,
}
