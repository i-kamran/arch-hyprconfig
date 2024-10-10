return {
    "bullets-vim/bullets.vim",
    config = function()
        -- Enable the plugin for specific file types
        vim.g.bullets_enabled_file_types = {
            "markdown",
            "text",
            "gitcommit",
            "scratch",
        }
    end,
}
