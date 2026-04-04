return {
  {
    'folke/which-key.nvim',
    event = 'VeryLazy',
    version = '^3.0.0',
    opts = {
    },
    keys = {
      {
        '<leader>?',
        function()
          require('which-key').show({ global = false })
        end,
        desc = 'Buffer Local Keymaps (which-key)',
      },
    },
  }
}
