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
    local mason_registry = require("mason-registry")
    if not mason_registry.is_installed("eslint_d") then
      mason_registry.get_package("eslint_d"):install()
    end

    -- Linter configuration for nvim-lint
    local lint = require("lint")
    lint.linters_by_ft = {
      javascript = { "eslint_d" },
      typescript = { "eslint_d" },
      javascriptreact = { "eslint_d" },
      typescriptreact = { "eslint_d" },
      svelte = { "eslint_d" },
      python = { "pylint", "mypy" }, -- mypy for type checking
      lua = { "luacheck" }, -- Lua linter
      go = { "golangcilint" },
      bash = { "bash-language-server", "shellcheck" },
      markdown = { "markdownlint" },
      json = { "jsonlint" },
      dockerfile = { "dockerls" },
      html = { "htmlhint" },
      c = { "cpplint", "cppcheck" },
      cpp = { "cpplint", "cppcheck" },
      -- rust = { "clippy" },
    }
    -- lint.linters.cppcheck.args = {
    --   "--enable=all", -- Enable all checks (style, performance, unused, etc.)
    -- }
    lint.linters.cpplint.args = {
      "--filter=-legal/copyright,-build/include", -- Suppress copyright and include warnings
    }
  end,
}
