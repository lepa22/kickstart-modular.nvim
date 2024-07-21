return {
  'folke/noice.nvim',
  event = 'VeryLazy',
  opts = {
    -- add any options here
  },
  dependencies = {
    -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
    'MunifTanjim/nui.nvim',
    -- OPTIONAL:
    --   `nvim-notify` is only needed, if you want to use the notification view.
    --   If not available, we use `mini` as the fallback
    'rcarriga/nvim-notify',
  },
  config = function()
    require('noice').setup {
      lsp = {
        -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
        override = {
          ['vim.lsp.util.convert_input_to_markdown_lines'] = true,
          ['vim.lsp.util.stylize_markdown'] = true,
          ['cmp.entry.get_documentation'] = true, -- requires hrsh7th/nvim-cmp
        },
        -- Don't show notification if LSP hover is not available.
        --   See: https://github.com/LazyVim/LazyVim/discussions/830#discussioncomment-7757328
        hover = {
          silent = true,
        },
      },
      -- you can enable a preset for easier configuration
      presets = {
        bottom_search = false, -- use a classic bottom cmdline for search
        command_palette = true, -- position the cmdline and popupmenu together
        long_message_to_split = true, -- long messages will be sent to a split
        inc_rename = false, -- enables an input dialog for inc-rename.nvim
        lsp_doc_border = false, -- add a border to hover docs and signature help
      },
      -- show @recording messages
      routes = {
        {
          view = 'notify',
          filter = { event = 'msg_showmode' },
        },
      },

      -- Scroll the documentation window [b]ack / [f]orward
      vim.keymap.set({ 'n', 'i', 's' }, '<C-f>', function()
        if not require('noice.lsp').scroll(4) then
          return '<c-f>'
        end
      end, { silent = true, expr = true }),

      vim.keymap.set({ 'n', 'i', 's' }, '<C-b>', function()
        if not require('noice.lsp').scroll(-4) then
          return '<c-b>'
        end
      end, { silent = true, expr = true }),
      -- dismiss noice messages
      vim.keymap.set('n', '<leader>nd', ':NoiceDismiss<CR>', { desc = 'Dismiss noice message' }),
    }
  end,
}
