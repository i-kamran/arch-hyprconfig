-- ~/.config/nvim/lua/plugins/indent-line.lua

return {
    -- Add indentation guides even on blank lines
    "lukas-reineke/indent-blankline.nvim",
    -- Enable `lukas-reineke/indent-blankline.nvim`
    -- See `:help ibl`
    main = "ibl",
    opts = {},
    config = function()
        require("ibl").setup()
    end,
}
