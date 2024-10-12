-- ~/.config/nvim/lua/plugins/treesitter.lua

return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
        local config = require("nvim-treesitter.configs")
        config.setup({
            ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "javascript", "html", "python" },
            auto_install = true,
            highlight = { enable = true },
            indent = { enable = true },
            additional_vim_regex_highlighting = false,
            require("vim.treesitter.query").set(
                "markdown",
                "highlights",
                [[
                    ;From MDeiml/tree-sitter-markdown
                    [
                      (fenced_code_block_delimiter)
                    ] @punctuation.delimiter
                ]]
            ),
        })
    end,
}
