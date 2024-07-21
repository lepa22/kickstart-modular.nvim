return {
  'linux-cultist/venv-selector.nvim',
  dependencies = {
    'neovim/nvim-lspconfig',
    'mfussenegger/nvim-dap',
    'mfussenegger/nvim-dap-python', --optional
    { 'nvim-telescope/telescope.nvim', branch = '0.1.x', dependencies = { 'nvim-lua/plenary.nvim' } },
  },
  lazy = false,
  branch = 'regexp', -- This is the regexp branch, use this for the new version
  config = function()
    -- This function gets called by the plugin when a new result from fd is received
    -- You can change the filename displayed here to what you like.
    -- Here in the example for linux/mac we replace the home directory with '~' and
    -- remove the /bin/python part.
    local function shorter_name(filename)
      return filename:gsub(os.getenv 'HOME', '~'):gsub('/bin/python', '')
    end

    require('venv-selector').setup {
      settings = {
        options = {
          -- If you put the callback here as a global option, its used for all searches (including the default ones by the plugin)
          on_telescope_result_callback = shorter_name,
        },
      },
    }
  end,
  keys = {
    { ',v', '<cmd>VenvSelect<cr>' },
  },
}
