return {
    {
        'neovim/nvim-lspconfig',
        dependencies = {
            'williamboman/mason.nvim',
            'williamboman/mason-lspconfig.nvim',
        },
        config = function()
            local lsp_capabilities = require('blink.cmp').get_lsp_capabilities()
            local lspconfig = require('lspconfig')

            require("mason").setup()
            require('mason-lspconfig').setup({
                ensure_installed = {
                    'lua_ls',
                    'gopls',
                    'clangd',
                    'elp',
                    'elixirls',
                    'ts_ls',
                    'pylsp',
                    'phpactor',
                    'marksman',
                    'taplo',
                    'julials',
                    'cssls',
                    'yamlls',
                },
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
