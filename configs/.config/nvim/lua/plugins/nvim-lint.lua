return {
  "mfussenegger/nvim-lint",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "williamboman/mason.nvim",
  },
  config = function()
    require("mason").setup()

    local lint = require("lint")

    -- =========================
    -- Linters per filetype
    -- =========================
    lint.linters_by_ft = {
      python = { "ruff", "mypy", "cspell" },
      lua = { "luacheck", "cspell" },
      javascript = { "eslint_d", "cspell" },
      typescript = { "eslint_d", "cspell" },
      javascriptreact = { "eslint_d", "cspell" },
      typescriptreact = { "eslint_d", "cspell" },
      json = { "jsonlint", "cspell" },
      html = { "htmlhint", "cspell" },
      css = { "stylelint", "cspell" },
      scss = { "stylelint", "cspell" },
      markdown = { "markdownlint", "cspell" },
      yaml = { "yamllint", "cspell" },
      c = { "cpplint", "cspell" },
      cpp = { "cpplint", "cspell" },
      go = { "golangci_lint", "cspell" },
      rust = { "cspell" },
      bash = { "shellcheck", "cspell" },
      java = { "checkstyle", "cspell" },
    }

    -- =========================
    -- Use direnv-activated executables
    -- =========================
    lint.linters.ruff.cmd = vim.fn.exepath("ruff")
    lint.linters.mypy.cmd = vim.fn.exepath("mypy")

    -- =========================
    -- cpplint extra args
    -- =========================
    lint.linters.cpplint.args = {
      "--filter=-legal/copyright,-build/include", -- suppress warnings
    }
  end,
}
