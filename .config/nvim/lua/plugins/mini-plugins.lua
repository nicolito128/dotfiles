return {
  {
    'echasnovski/mini.pairs',
    version = '*',
    config = function()
      require('mini.pairs').setup()
    end
  },
  {
    'echasnovski/mini.surround',
    version = '*',
    config = function()
      require('mini.surround').setup()
    end
  },
  {
    'echasnovski/mini.statusline',
    version = '*',
    config = function()
      require('mini.statusline').setup()
    end
  },
  {
    'echasnovski/mini.move',
    version = '*',
    config = function()
      require('mini.move').setup()
    end
  },
  {
    'echasnovski/mini-git',
    version = '*',
    main = 'mini.git',
    config = function()
      require('mini.git').setup()
    end
  },
}
