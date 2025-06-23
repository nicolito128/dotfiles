return {
    {
        'mason-org/mason.nvim',
        opts = {},
    },
    {
        'mason-org/mason-lspconfig.nvim',
        version = '^1.0.0',
        dependencies = {
            'mason-org/mason.nvim',
            'neovim/nvim-lspconfig',
        },
        opts = {
            ensure_installed = {
                'lua_ls',
                'gopls',
                'clangd',
                'elp', -- erlang
                'lexical', -- elixir
                'ts_ls',
                'pylsp', -- python
                'phpactor',
                'marksman', -- markdown
                'taplo', -- toml
                'julials',
                'html',
                'cssls',
                'yamlls',
            },
        },
        config = function()
            local lsp_capabilities = require('blink.cmp').get_lsp_capabilities()
            local lspconfig = require('lspconfig')

            require('mason-lspconfig').setup({
                handlers = {
                    function(server)
                        lspconfig[server].setup({
                            capabilities = lsp_capabilities,
                        })
                    end,
                }
            })
        end
    },
}
