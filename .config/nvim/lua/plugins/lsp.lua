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
                ensure_installed = {'lua_ls', 'gopls'},
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
