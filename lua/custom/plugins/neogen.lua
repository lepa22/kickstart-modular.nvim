return {
  'danymat/neogen',
  config = function()
    vim.api.nvim_set_keymap('n', '<Leader>dd', ":lua require('neogen').generate()<CR>", { noremap = true, silent = true, desc = 'Generate [D]ocstring' })

    require('neogen').setup {
      enabled = true,
      snippet_engine = 'luasnip',
      languages = {
        python = {
          template = {
            annotation_convention = 'numpydoc',
          },
        },
      },
    }
  end,
  -- Uncomment next line if you want to follow only stable versions
  -- version = "*"
}
