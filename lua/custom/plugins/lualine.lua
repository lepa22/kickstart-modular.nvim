return {
  'nvim-lualine/lualine.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  config = function()
    require('lualine').setup {
      -- use catppuccin theme
      options = {
        theme = 'catppuccin',
      },
      -- show @recording messages in lualine when using the noice plugin
      -- See: https://github.com/folke/noice.nvim/wiki/Configuration-Recipes#show-recording-messages
      sections = {
        lualine_x = {
          {
            ---@diagnostic disable-next-line: undefined-field
            require('noice').api.status.mode.get,
            ---@diagnostic disable-next-line: undefined-field
            cond = require('noice').api.status.mode.has,
            color = { fg = '#ff9e64' },
          },
        },
      },
    }
  end,
}
