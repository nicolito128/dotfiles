return {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 9999,
    config = function()
        require("catppuccin").setup({
            flavour = "macchiato",
            transparent_background = true,
            show_end_of_buffer = true
        });
        vim.cmd("silent! colorscheme catppuccin")
    end
}
