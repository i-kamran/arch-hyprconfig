-- ~/.config/nvim/lua/plugins/catppuccin.lua

return {
  "catppuccin/nvim",
  lazy = false,
  name = "catppuccin",
  priority = 1000, 
  config = function()
    require("plugins/theme")
    vim.cmd.colorscheme "catppuccin"
  end
}