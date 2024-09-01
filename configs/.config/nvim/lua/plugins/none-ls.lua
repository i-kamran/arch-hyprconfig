return {
    "nvimtools/none-ls.nvim",
    dependencies = {
        "williamboman/mason.nvim",
        "jay-babu/mason-null-ls.nvim",
        "nvimtools/none-ls-extras.nvim",
    },
    config = function()
        local null_ls = require("null-ls")
        local mason_null_ls = require("mason-null-ls")

        mason_null_ls.setup({
            ensure_installed = {
                -- Formatters
                "prettierd",
                "stylua",
                "isort",
                "black",

                -- Linters
                "eslint_d",
                "flake8",
                "shellcheck"
            },
            automatic_setup = true,
        })

        null_ls.setup({
            sources = {
                -- Formatters
                null_ls.builtins.formatting.stylua,
                null_ls.builtins.formatting.prettierd,
                null_ls.builtins.formatting.isort,
                null_ls.builtins.formatting.black,

                -- Linters
                require("none-ls.diagnostics.eslint_d"),
                require("none-ls.diagnostics.flake8"),

                null_ls.builtins.completion.spell,
                null_ls.builtins.diagnostics.shellcheck,
            },
        })
    end,
}
