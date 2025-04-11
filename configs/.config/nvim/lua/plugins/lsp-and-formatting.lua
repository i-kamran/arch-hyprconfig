-- ~/.config/nvim/lua/plugins/lsp-and-formatting.lua

return {
  "neovim/nvim-lspconfig",
  dependencies = {
    -- LSP Support
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "WhoIsSethDaniel/mason-tool-installer.nvim",

    -- Autocompletion
    "hrsh7th/nvim-cmp", -- Required
    "hrsh7th/cmp-nvim-lsp", -- Required
    "L3MON4D3/LuaSnip", -- Required
    "rafamadriz/friendly-snippets",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-cmdline",
    "saadparwaiz1/cmp_luasnip",
  },
  config = function()
    ---
    -- LSP setup
    ---

    vim.opt.signcolumn = "yes" -- Prevent layout shifts

    -- Extend capabilities
    local capabilities = require("cmp_nvim_lsp").default_capabilities()
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

      -- a list of all tools you want to ensure are installed upon
      -- start
      ensure_installed = {

        -- you can pin a tool to a particular version
        -- { "golangci-lint", version = "v1.47.0" },

        -- you can turn off/on auto_update per tool
        -- { "bash-language-server", auto_update = true },

        -- Formatters
        "isort",
        "black",
        "stylua",
        "gofumpt",
        "prettierd",
        "prettier",
        "beautysh",
        "clang-format",
        "rustfmt",
        "google-java-format",

        -- Linters
        "pylint",
        "mypy",
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
        "pylsp",
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
        function(server_name)
          lspconfig[server_name].setup({
            capabilities = capabilities,
            -- Add server-specific settings here
            settings = {
              -- Example for Lua LSP
              Lua = {
                diagnostics = {
                  globals = { "vim" },
                },
              },
            },
          })
        end,
        ["pyright"] = function()
          lspconfig.pyright.setup({
            capabilities = capabilities,
            settings = {
              python = {
                analysis = {
                  autoSearchPaths = true,
                  diagnosticMode = "workspace",
                  useLibraryCodeForTypes = true,
                  typeCheckingMode = "strict",
                },
                pythonPath = vim.g.python3_host_prog,
              },
            },
          })
        end,
        ["pylsp"] = function()
          lspconfig.pylsp.setup({
            capabilities = capabilities,
            settings = {
              pylsp = {
                plugins = {
                  jedi_completion = {
                    enabled = true,
                    include_params = true,
                    include_class_objects = true,
                    include_function_objects = true,
                  },
                  -- jedi_signature_help = { enabled = true }, -- Enable signature help
                },
              },
            },
            pythonPath = vim.g.python3_host_prog,
          })
        end,
        ["jdtls"] = function()
          lspconfig.jdtls.setup({
            capabilities = capabilities,
            cmd = { "jdtls" },
            root_dir = require("lspconfig").util.root_pattern(".git", "mvnw", "gradlew"),
          })
        end,
      },
    })
    local cmp = require("cmp")
    local luasnip = require("luasnip")
    local cmp_select = { behavior = cmp.SelectBehavior.Select }

    require("luasnip.loaders.from_vscode").lazy_load()

    cmp.setup({
      snippet = {
        expand = function(args)
          luasnip.lsp_expand(args.body)
        end,
      },
      window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
      },
      sources = {
        { name = "nvim_lsp", priority = 1000 },
        { name = "luasnip", priority = 750 },
        { name = "buffer", priority = 500 },
        { name = "path", priority = 250 },
      },
      mapping = cmp.mapping.preset.insert({
        ["<C-p>"] = cmp.mapping.select_prev_item(cmp_select),
        ["<C-n>"] = cmp.mapping.select_next_item(cmp_select),
        ["<C-y>"] = cmp.mapping.confirm({ select = true }),
        ["<A-Tab>"] = cmp.mapping.confirm({ select = true }),
        ["<C-Space>"] = cmp.mapping.complete(),
        -- Add these new mappings for snippet navigation
        ["<Tab>"] = cmp.mapping(function(fallback)
          if luasnip.expand_or_jumpable() then
            luasnip.expand_or_jump()
          else
            fallback()
          end
        end, { "i", "s" }),

        ["<S-Tab>"] = cmp.mapping(function(fallback)
          if luasnip.jumpable(-1) then
            luasnip.jump(-1)
          else
            fallback()
          end
        end, { "i", "s" }),
      }),
    })
    -- `/` cmdline setup.
    cmp.setup.cmdline("/", {
      mapping = cmp.mapping.preset.cmdline(),
      sources = {
        { name = "buffer" },
      },
    })

    -- `:` cmdline setup.
    cmp.setup.cmdline(":", {
      mapping = cmp.mapping.preset.cmdline(),
      sources = cmp.config.sources({
        { name = "path" },
        { name = "cmdline" },
      }),
    })
  end,
}
