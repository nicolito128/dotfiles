return {
    {
        'nvim-treesitter/nvim-treesitter',
        version = '0.10.0',
        build = ':TSUpdate',
        event = { "BufReadPost", "BufNewFile" },
        main = 'nvim-treesitter.configs',
        opts = {
            ensure_installed = {
                'lua',
                'luadoc',
                'vim',
                'vimdoc',
            },
            auto_install = true,
            highlight = {
                enable = true,
                additional_vim_regex_highlighting = false,
                disable = function(lang, buf)
                    local max_filesize = 100 * 1024 -- 100 KB
                    local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
                    if ok and stats and stats.size > max_filesize then
                        return true
                    end
                end,
            },
            indent = { enable = false },
        },
    },
    {
        'nvim-treesitter/nvim-treesitter-context',
        tag = "v1.0.0",
        opts = { enable = true, max_lines = 3 },
    }
}
