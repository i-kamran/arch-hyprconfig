-- ~/.config/nvim/lua/plugins/conform.lua

return {
  "stevearc/conform.nvim",
  event = "VeryLazy",
  cmd = { "ConformInfo" },
  opts = {

    formatters_by_ft = {
      lua = { "stylua" },
      python = { "isort", "black" },
      javascript = { "prettierd", "prettier", stop_after_first = true },
      typescript = { "prettierd", "prettier", stop_after_first = true },
      javascriptreact = { "prettierd", "prettier", stop_after_first = true },
      typescriptreact = { "prettierd", "prettier", stop_after_first = true },
      json = { "prettierd", "prettier", stop_after_first = true },
      html = { "prettierd", "prettier", stop_after_first = true },
      css = { "prettierd", "prettier", stop_after_first = true },
      scss = { "prettierd", "prettier", stop_after_first = true },
      markdown = { "prettierd", "prettier", stop_after_first = true },
      yaml = { "prettierd", "prettier", stop_after_first = true },
      rust = { "rustfmt", lsp_format = "fallback" },
      c = { "clang-format" },
      cpp = { "clang-format" },
      java = {"google-java-format"},
      go = { "gofumpt", "golangci-lint" },
      bash = { "beautysh" },
    },

    formatters = {
      stylua = {
        prepend_args = { "--indent-type", "spaces", "--indent-width", "2" },
      },
      prettier = {
        prepend_args = { "--print-width", "80" },
      },
      clang_format = {
        prepend_args = { "--style", "{IndentWidth: 2}" },
      },
    },

    -- Optional: Set notify to false to disable notifications
    notify_on_error = true,
  },
}
