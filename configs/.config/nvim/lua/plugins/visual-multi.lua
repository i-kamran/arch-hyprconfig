-- ~/.config/nvim/lua/plugins/visual-multi.lua

return {
    'mg979/vim-visual-multi',
    config = function()
        -- Disable specific key mappings for this plugin
        vim.g['VM_maps'] = {
            ['Goto Next'] = '',
            ['Goto Prev'] = '',
            ['Toggle Block'] = '',
        }
    end
}
