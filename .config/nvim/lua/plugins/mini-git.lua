return {
    'echasnovski/mini-git',
    version = '*',
    main = 'mini.git',
    config = function()
        require('mini.git').setup()
    end
}
