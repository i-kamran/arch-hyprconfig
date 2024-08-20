-- ~/.config/nvim/lua/plugins/telescope.lua

return {
  'nvim-telescope/telescope.nvim',
  dependencies = { 'nvim-lua/plenary.nvim' },
  config = function()
    require('telescope').setup {
      defaults = {
        file_ignore_patterns = {
          "node_modules", "build", "dist", "yarn.lock", '.git'
        },
        vimgrep_arguments = {
          "rg",
          "--follow",        -- Follow symbolic links
          "--hidden",        -- Search for hidden files
          "--no-heading",    -- Don't group matches by each file
          "--with-filename", -- Print the file path with the matched lines
          "--line-number",   -- Show line numbers
          "--column",        -- Show column numbers
          "--smart-case",    -- Smart case search
        },
      },
      pickers = {
        find_files = {
          hidden = true,
        },
      },
    }
    
    -- Telescope keybindings
    local builtin = require('telescope.builtin')
    vim.keymap.set('n', '<C-p>', builtin.find_files, {})
    vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
end
}