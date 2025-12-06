return {
  'nvimdev/dashboard-nvim',
  version = '*',

  event = 'VimEnter',

  dependencies = {
    'nvim-tree/nvim-web-devicons'
  },

  config = function()
    require('dashboard').setup({})
  end,
}
