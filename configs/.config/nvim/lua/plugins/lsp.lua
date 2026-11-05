-- ~/.config/nvim/lua/plugins/lsp.lua
return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "WhoIsSethDaniel/mason-tool-installer.nvim",
  },
  config = function()
    vim.opt.signcolumn = "yes"

    -- Setup capabilities
    local capabilities = require("cmp_nvim_lsp").default_capabilities()
    capabilities.textDocument.completion.completionItem.snippetSupport = true
    capabilities.textDocument.completion.completionItem.resolveSupport = {
      properties = {
        "documentation",
        "detail",
        "additionalTextEdits",
      },
    }

    local lspconfig = require("lspconfig")
    local lspconfig_defaults = lspconfig.util.default_config
    lspconfig_defaults.capabilities = vim.tbl_deep_extend("force", lspconfig_defaults.capabilities, capabilities)

    -- Mason setup
    require("mason").setup({
      ui = {
        icons = {
          package_installed = "✓",
          package_pending = "➜",
          package_uninstalled = "✗",
        },
      },
    })

    require("mason-tool-installer").setup({
      ensure_installed = {
        -- Formatters
        "isort",
        "black",
        "stylua",
        "gofumpt",
        "prettierd",
        "prettier",
        "beautysh",
        "clang-format",
        -- "rustfmt",
        "google-java-format",

        -- Linters
        "luacheck",
        "golangci-lint",
        "eslint_d",
        "jsonlint",
        "htmlhint",
        "cpplint",
        "markdownlint",
        "cspell",
        "checkstyle",

        -- Language Servers
        -- "pylsp",
        "jedi-language-server",
        "pyright",
        "lua-language-server",
        "lua_ls",
        "gopls",
        "jsonls",
        "ts_ls",
        "html",
        "cssls",
        "tailwindcss",
        "dockerls",
        "bash-language-server",
        "marksman",
        "rust-analyzer",
        "clangd",
        "jdtls",
        "emmet_ls",

        -- DAP
        "debugpy",
        "codelldb",
        "delve",
      },
      auto_update = true,
      run_on_start = true,
    })

    require("mason-lspconfig").setup({
      handlers = {
        -- Default handler
        function(server_name)
          lspconfig[server_name].setup({ capabilities = capabilities })
        end,

        ["lua_ls"] = function()
          lspconfig.lua_ls.setup({
            capabilities = capabilities,
            settings = { Lua = { diagnostics = { globals = { "vim" } } } },
          })
        end,

        -- JEDI: This is your primary Python completion engine
        ["jedi_language_server"] = function()
          lspconfig.jedi_language_server.setup({
            capabilities = capabilities,
            init_options = {
              completion = {
                disableSnippets = false,
                resolveEagerly = true,
              },
            },
          })
        end,

        -- PYRIGHT: Keep for static analysis, but disable its completion
        -- to prevent duplicate/messy results with Jedi
        ["pyright"] = function()
          lspconfig.pyright.setup({
            capabilities = capabilities,
            settings = {
              python = {
                analysis = {
                  diagnosticMode = "openFilesOnly",
                  typeCheckingMode = "basic",
                },
              },
            },
            -- Disable completion results from Pyright
            on_attach = function(client, _)
              client.server_capabilities.completionProvider = false
            end,
          })
        end,
        -- JDTLS
        ["jdtls"] = function()
          lspconfig.jdtls.setup({
            capabilities = capabilities,
            cmd = { "jdtls" },
            root_dir = require("lspconfig").util.root_pattern(".git", "mvnw", "gradlew"),
          })
        end,

        -- Emmet
        ["emmet_ls"] = function()
          lspconfig.emmet_ls.setup({
            capabilities = capabilities,
            filetypes = {
              "html",
              "css",
              "javascriptreact",
              "typescriptreact",
              "svelte",
              "vue",
            },
            init_options = {
              html = {
                options = {
                  -- ["bem.enabled"] = true,
                },
              },
            },
          })
        end,
      },
    })
  end,
}
