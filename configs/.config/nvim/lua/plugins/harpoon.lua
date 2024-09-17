-- ~/.config/nvim/lua/plugins/harpoon.lua

return {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
        local harpoon = require("harpoon")
        -- REQUIRED
        harpoon:setup()
        -- REQUIRED

        ---------------
        --- KEYMAPS ---
        ---------------

        vim.keymap.set("n", "<A-a>", function() harpoon:list():add() end, { desc = "[a]dd harpoon" })
        vim.keymap.set("n", "<A-e>", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)

        vim.keymap.set("n", "<A-1>", function() harpoon:list():select(1) end)
        vim.keymap.set("n", "<A-2>", function() harpoon:list():select(2) end)
        vim.keymap.set("n", "<A-3>", function() harpoon:list():select(3) end)
        vim.keymap.set("n", "<A-4>", function() harpoon:list():select(4) end)
        vim.keymap.set("n", "<A-5>", function() harpoon:list():select(5) end)
        -- Toggle previous & next buffers stored within Harpoon list
        vim.keymap.set("n", "<A-S-P>", function() harpoon:list():prev() end)
        vim.keymap.set("n", "<A-S-N>", function() harpoon:list():prev() end)
        vim.keymap.set("n", "<leader>A-1>", function() harpoon:list():replace_at(1) end)
        vim.keymap.set("n", "<leader>A-2>", function() harpoon:list():replace_at(2) end)
        vim.keymap.set("n", "<leader>A-3>", function() harpoon:list():replace_at(3) end)
        vim.keymap.set("n", "<leader>A-4>", function() harpoon:list():replace_at(4) end)
        vim.keymap.set("n", "<leader>A-5>", function() harpoon:list():replace_at(5) end)
    end,
}
