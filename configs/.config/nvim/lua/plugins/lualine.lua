return {
  "nvim-lualine/lualine.nvim",
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  config = function()
    local colors = {
      black        = '#282828',
      white        = '#ebdbb2',
      red          = '#fb4934',
      green        = '#b8bb26',
      blue         = '#83a598',
      yellow       = '#fe8019',
      gray         = '#a89984',
      darkgray     = '#3c3836',
      lightgray    = '#504945',
    }

    -- Define your custom theme
    local custom_theme = {
      normal = {
        a = {bg = colors.gray, fg = colors.black, gui = 'bold'},
        b = {bg = colors.lightgray, fg = colors.white},
        c = {bg = colors.darkgray, fg = colors.gray}
      },
      insert = {
        a = {bg = colors.blue, fg = colors.black, gui = 'bold'},
        b = {bg = colors.lightgray, fg = colors.white},
        c = {bg = colors.lightgray, fg = colors.white}
      },
      visual = {
        a = {bg = colors.yellow, fg = colors.black, gui = 'bold'},
        b = {bg = colors.lightgray, fg = colors.white},
        c = {bg = colors.darkgray, fg = colors.black}
      },
      replace = {
        a = {bg = colors.red, fg = colors.black, gui = 'bold'},
        b = {bg = colors.lightgray, fg = colors.white},
        c = {bg = colors.black, fg = colors.white}
      },
      command = {
        a = {bg = colors.green, fg = colors.black, gui = 'bold'},
        b = {bg = colors.lightgray, fg = colors.white},
        c = {bg = colors.darkgray, fg = colors.black}
      },
      inactive = {
        a = {bg = colors.darkgray, fg = colors.gray, gui = 'bold'},
        b = {bg = colors.darkgray, fg = colors.gray},
        c = {bg = colors.darkgray, fg = colors.gray}
      }
    }

    -- Setup lualine with the custom theme
    require('lualine').setup {
      options = {
        theme = custom_theme
      }
    }
  end
}
