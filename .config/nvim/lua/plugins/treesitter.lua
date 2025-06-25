return {
    {
        'OXY2DEV/markview.nvim',
        lazy = false,
        dependencies = {
            'saghen/blink.cmp',
        },
    },
    {
        'nvim-treesitter/nvim-treesitter',
        dependencies = { 'OXY2DEV/markview.nvim' },
        build = ':TSUpdate',
        main = 'nvim-treesitter.configs',
        opts = {
            ensure_installed = {
                'bash',
                'c',
                'diff',
                'html',
                'css',
                'lua',
                'luadoc',
                'markdown',
                'markdown_inline',
                'query',
                'vim',
                'vimdoc',
                'go',
                'javascript',
                'typescript',
                'elixir',
                'erlang',
                'python',
                'julia',
            },
            auto_install = true,
            highlight = {
                enable = true,
                additional_vim_regex_highlighting = { 'ruby' },
            },
            indent = { enable = true, disable = { 'ruby' } },
            incremental_selection = {
                enable = true,
                keymaps = {
                    init_selection = '<CR>',
                    scope_incremental = '<CR>',
                    node_incremental = '<TAB>',
                    node_decremental = '<S-TAB>',
                },
            },
        },
    },
    { 'windwp/nvim-ts-autotag', event = 'VeryLazy' }
}
