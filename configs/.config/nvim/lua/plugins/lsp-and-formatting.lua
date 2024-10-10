-- ~/.config/nvim/lua/plugins/lsp-and-formatting.lua

return {
    {
        "neovim/nvim-lspconfig",
        lazy = true,
        event = "VeryLazy",
        dependencies = {
            "williamboman/mason.nvim",
            "williamboman/mason-lspconfig.nvim",
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-path",
            "hrsh7th/cmp-cmdline",
            "hrsh7th/nvim-cmp",
            "L3MON4D3/LuaSnip",
            "saadparwaiz1/cmp_luasnip",
            "j-hui/fidget.nvim",
        },
        config = function()
            local cmp = require("cmp")
            local cmp_lsp = require("cmp_nvim_lsp")
            local capabilities = vim.tbl_deep_extend(
                "force",
                {},
                vim.lsp.protocol.make_client_capabilities(),
                cmp_lsp.default_capabilities()
            )

            require("fidget").setup({})
            require("mason").setup({})
            require("mason-lspconfig").setup({
                ensure_installed = {
                    "lua_ls",
                    "rust_analyzer",
                    "gopls",
                    "ts_ls",
                    "cssls",
                    "html",
                    "clangd",
                    "pyright",
                    "marksman",
                    "bashls",
                    "tailwindcss",
                },
                automatic_installation = true,
                handlers = {
                    function(server_name)
                        require("lspconfig")[server_name].setup({
                            capabilities = capabilities,
                        })
                    end,
                    ["pyright"] = function()
                        require("lspconfig").pyright.setup({
                            capabilities = capabilities,
                            settings = {
                                python = {
                                    analysis = {
                                        typeCheckingMode = "strict",
                                    },
                                },
                            },
                        })
                    end,
                },
            })

            -- Snippets and completion setup
            local cmp_select = { behavior = cmp.SelectBehavior.Select }
            cmp.setup({
                snippet = {
                    expand = function(args)
                        require("luasnip").lsp_expand(args.body)
                    end,
                },
                mapping = cmp.mapping.preset.insert({
                    ["<C-p>"] = cmp.mapping.select_prev_item(cmp_select),
                    ["<C-n>"] = cmp.mapping.select_next_item(cmp_select),
                    ["<C-y>"] = cmp.mapping.confirm({ select = true }),
                    ["<A-Tab>"] = cmp.mapping.confirm({ select = true }),
                    ["<C-Space>"] = cmp.mapping.complete(),
                }),
                sources = cmp.config.sources({
                    { name = "nvim_lsp" },
                    { name = "luasnip" },
                }, {
                    { name = "buffer" },
                }),
            })

            vim.diagnostic.config({
                float = {
                    focusable = false,
                    style = "minimal",
                    border = "rounded",
                    source = "always",
                    header = "",
                    prefix = "",
                },
            })
        end,
    },
    {
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
                    "shellcheck",
                    "markdownlint-cli2",
                    "markdown-toc",
                },
                automatic_installation = true,
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
                    -- Other
                    null_ls.builtins.completion.spell,
                    null_ls.builtins.diagnostics.markdownlint.with({
                        diagnostics_format = "#{m} (#{c})",
                    }),
                },
                on_attach = function(client, bufnr)
                    local filetype = vim.api.nvim_buf_get_option(bufnr, "filetype")
                    if filetype == "c" or filetype == "cpp" then
                        client.stop()
                    end
                end,
            })
        end,
    },
}
