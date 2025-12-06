return {
    {
        'stevearc/oil.nvim',
        opts = {
            default_file_explorer = true,
            win_options = {
                signcolumn = 'yes:2',
                wrap = true,
            },
            delete_to_trash = true,
            view_options = {
                show_hidden = true,
                natural_order = true,
            },
            float = {
                -- Padding around the floating window
                padding = 2,
                max_width = 90,
                max_height = 0,
                -- border = "rounded",
                win_options = {
                    winblend = 0,
                },
            },
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
