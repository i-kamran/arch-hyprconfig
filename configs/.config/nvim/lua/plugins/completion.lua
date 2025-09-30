-- ~/.config/nvim/lua/plugins/completion.lua
return {
  "hrsh7th/nvim-cmp",
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    "L3MON4D3/LuaSnip",
    "rafamadriz/friendly-snippets",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-cmdline",
    "saadparwaiz1/cmp_luasnip",
  },
  config = function()
    -- Load LuaSnip FIRST to ensure it's ready
    local luasnip = require("luasnip")
    require("luasnip.loaders.from_vscode").lazy_load()

    -- Ensure LuaSnip is fully loaded
    vim.schedule(function()
      luasnip.filetype_extend("all", { "all" })
    end)

    local cmp = require("cmp")
    local cmp_select = { behavior = cmp.SelectBehavior.Select }

    cmp.setup({
      preselect = cmp.PreselectMode.None,
      snippet = {
        expand = function(args)
          -- Ensure LuaSnip is ready before expanding
          if not luasnip then
            luasnip = require("luasnip")
          end
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
      formatting = {
        format = function(entry, vim_item)
          -- Modify function completions to snippets
          if entry.source.name == "nvim_lsp" then
            local completion_item = entry.completion_item
            if completion_item.kind == 2 or completion_item.kind == 3 then
              local detail = completion_item.detail or ""
              local label = completion_item.label or ""
              
              -- Extract parameters
              local params_str = detail:match("%((.-)%)") or label:match("%((.-)%)")
              
              if params_str and params_str ~= "" then
                local snippet_params = {}
                local idx = 1
                for param in params_str:gmatch("[^,]+") do
                  param = param:match("^%s*(.-)%s*$")
                  local param_name = param:match("^([^:=]+)") or param
                  param_name = param_name:match("^%s*(.-)%s*$")
                  if param_name ~= "" then
                    table.insert(snippet_params, "${" .. idx .. ":" .. param_name .. "}")
                    idx = idx + 1
                  end
                end
                local func_name = label:match("^([^(]+)") or label
                completion_item.insertText = func_name .. "(" .. table.concat(snippet_params, ", ") .. ")$0"
                completion_item.insertTextFormat = 2
              else
                local func_name = label:match("^([^(]+)") or label
                completion_item.insertText = func_name .. "($0)"
                completion_item.insertTextFormat = 2
              end
            end
          end
          
          -- Add source info
          vim_item.menu = ({
            nvim_lsp = "[LSP]",
            luasnip = "[Snip]",
            buffer = "[Buf]",
            path = "[Path]",
          })[entry.source.name]
          return vim_item
        end,
      },
      mapping = cmp.mapping.preset.insert({
        ["<C-p>"] = cmp.mapping.select_prev_item(cmp_select),
        ["<C-n>"] = cmp.mapping.select_next_item(cmp_select),
        ["<C-y>"] = cmp.mapping.confirm({ 
          behavior = cmp.ConfirmBehavior.Replace,
          select = true 
        }),
        ["<A-Tab>"] = cmp.mapping.confirm({ 
          behavior = cmp.ConfirmBehavior.Replace,
          select = true 
        }),
        ["<CR>"] = cmp.mapping.confirm({ 
          behavior = cmp.ConfirmBehavior.Replace,
          select = false 
        }),
        ["<C-Space>"] = cmp.mapping.complete(),

        -- Snippet navigation
        ["<Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_next_item()
          elseif luasnip.locally_jumpable(1) then
            luasnip.jump(1)
          else
            fallback()
          end
        end, { "i", "s" }),

        ["<S-Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_prev_item()
          elseif luasnip.locally_jumpable(-1) then
            luasnip.jump(-1)
          else
            fallback()
          end
        end, { "i", "s" }),
      }),
      experimental = {
        ghost_text = false,
      },
    })

    -- `/` cmdline setup
    cmp.setup.cmdline("/", {
      mapping = cmp.mapping.preset.cmdline(),
      sources = {
        { name = "buffer" },
      },
    })

    -- `:` cmdline setup
    cmp.setup.cmdline(":", {
      mapping = cmp.mapping.preset.cmdline(),
      sources = cmp.config.sources({
        { name = "path" },
        { name = "cmdline" },
      }),
    })
  end,
}
