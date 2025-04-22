return {
  "mfussenegger/nvim-lint",
  event = "VeryLazy", -- Load nvim-lint and mason on VeryLazy event
  dependencies = {
    "williamboman/mason.nvim", -- Ensure mason is installed
  },
  config = function()
    -- Set up mason to install eslint_d if not present
    require("mason").setup()

    -- Check if eslint_d is installed and install if missing
    -- local mason_registry = require("mason-registry")
    --  if not mason_registry.is_installed("eslint_d") then
    --   mason_registry.get_package("eslint_d"):install()
    -- end

    -- Linter configuration for nvim-lint
    local lint = require("lint")
    lint.linters.pylint.cmd = "/home/i-kamran/.venv/bin/pylint"
    lint.linters.mypy.cmd = "/home/i-kamran/.venv/bin/mypy"


    lint.linters_by_ft = {
      javascript = { "eslint_d", "cspell" },
      typescript = { "eslint_d", "cspell" },
      javascriptreact = { "eslint_d", "cspell" },
      typescriptreact = { "eslint_d", "cspell" },
      svelte = { "eslint_d", "cspell" },
      python = { "pylint", "mypy", "cspell" }, -- mypy for type checking
      lua = { "luacheck", "cspell" }, -- Lua linter
      go = { "golangcilint", "cspell" },
      bash = { "bash-language-server", "shellcheck", "cspell" },
      markdown = { "markdownlint", "cspell" },
      json = { "jsonlint", "cspell" },
      dockerfile = { "dockerls", "cspell" },
      html = { "htmlhint", "cspell" },
      c = { "cpplint", "cppcheck", "cspell" },
      cpp = { "cpplint", "cppcheck", "cspell" },
      java = { "checkstyle", "cspell" },
      rust = { "cspell" },
      -- rust = { "clippy" },
    }
    -- lint.linters.cppcheck.args = {
    --   "--enable=all", -- Enable all checks (style, performance, unused, etc.)
    -- }
    lint.linters.cpplint.args = {
      "--filter=-legal/copyright,-build/include", -- Suppress copyright and include warnings
    }
    -- lint.linters.cspell.args = {
    --   "--show-suggestions",
    --   -- "--config",
    --   -- "~/.config/cspell/cspell.json",
    -- }
  end,
}
