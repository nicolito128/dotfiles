return {
    {
        'mason-org/mason.nvim',
        version = '^2.0.0',
        opts = {},
    },
    {
        'mason-org/mason-lspconfig.nvim',
        version = '^2.0.0',
        dependencies = {
            'mason-org/mason.nvim',
            'neovim/nvim-lspconfig',
        },
        opts = {
            ensure_installed = {
                'lua_ls',
                'gopls',
                'clangd',
                'elp',      -- erlang
                'lexical',  -- elixir
                'ts_ls',
                'pylsp',    -- python
                'marksman', -- markdown
                'html',
                'cssls',
            },
        },
        config = function(_lp, opts)
            local lsp_capabilities = require('blink.cmp').get_lsp_capabilities()
            local lspconfig = require('lspconfig')

            for i = 1, #opts.ensure_installed, 1
            do
                lspconfig[opts.ensure_installed[i]].setup({
                    capabilities = lsp_capabilities,
                })
            end
        end
    },
}
