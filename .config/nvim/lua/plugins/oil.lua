return {
    {
        'stevearc/oil.nvim',
        opts = {
            win_options = {
                signcolumn = 'yes:2',
            }
        },
        dependencies = {
            { 'echasnovski/mini.icons', opts = {} }
        },
        lazy = false,
    },
    {
        'refractalize/oil-git-status.nvim',

        dependencies = {
            'stevearc/oil.nvim',
        },

        config = true,
    },
}
