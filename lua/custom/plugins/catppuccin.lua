return {
  'catppuccin/nvim',
  name = 'catppuccin',
  priority = 1000,
  init = function()
    vim.cmd.colorscheme 'catppuccin'
  end,
  config = function()
    require('catppuccin').setup {
      integrations = {
        mini = {
          enabled = true,
          indentscope_color = '',
        },
        mason = true,
        neotree = true,
        lsp_trouble = true,
        which_key = true,
      },
    }
  end,
}
