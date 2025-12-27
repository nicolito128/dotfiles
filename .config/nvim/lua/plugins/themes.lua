return {
    -- {
    -- 'p00f/alabaster.nvim',
    -- version = 'main',
    -- config = function()
    -- vim.cmd('silent! colorscheme alabaster')
    -- end
    -- },
    {
        'vague2k/vague.nvim',
        lazy = false,
        priority = 1000,
        config = function()
            require('vague').setup({
            })
            vim.cmd('silent! colorscheme vague')
        end
    },
    -- {
    --     'catppuccin/nvim',
    --     name = 'catppuccin',
    --     priority = 9999,
    --     config = function()
    --         require('catppuccin').setup({
    --             flavour = 'mocha',
    --             transparent_background = true,
    --             show_end_of_buffer = true
    --         });
    --         -- vim.cmd('silent! colorscheme catppuccin')
    --     end
    -- },
    -- {
    --     'stevedylandev/darkmatter-nvim',
    --     name = 'darkmatter',
    --     lazy = false,
    --     priority = 9999,
    --     config = function()
    --         vim.cmd('silent! colorscheme darkmatter')
    --     end,
    -- }
}
