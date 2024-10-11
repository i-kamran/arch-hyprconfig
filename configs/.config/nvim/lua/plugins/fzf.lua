-- ~/.config/nvim/lua/plugins/fzf.lua

return {
    "ibhagwan/fzf-lua",
    lazy = true,
    event = "VeryLazy",
    -- optional for icon support
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
        -- calling `setup` is optional for customization
        require("fzf-lua").setup({})
    end,
}
