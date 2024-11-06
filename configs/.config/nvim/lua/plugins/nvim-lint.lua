return {
  "mfussenegger/nvim-lint",
  event = "VeryLazy",  -- Load nvim-lint and mason on VeryLazy event
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
      python = {"pylint"},
    }

    -- Autocommand to trigger linting on specific events
    local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })
    vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
      group = lint_augroup,
      callback = function()
        lint.try_lint()
      end,
    })

    -- Keymap to trigger linting manually
    vim.keymap.set("n", "<leader>ll", function()
      lint.try_lint()
    end, { desc = "Trigger linting for current file" })
  end,
}
