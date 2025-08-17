return {
    {
        "catppuccin/nvim",
        name = "catppuccin",
        priority = 9999,
        config = function()
            require("catppuccin").setup({
                flavour = "mocha",
                transparent_background = true,
                show_end_of_buffer = true
            });
            -- vim.cmd("silent! colorscheme catppuccin")
        end
    },
    {
        'stevedylandev/darkmatter-nvim',
        name = "darkmatter",
        lazy = false,
        priority = 9999,
        config = function()
            vim.cmd('silent! colorscheme darkmatter')
        end,
    }
}
