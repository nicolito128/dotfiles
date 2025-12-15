return {
    {
        'L3MON4D3/LuaSnip',
        version = '^2.0.0',
        keys = {},
    },
    {
        'saghen/blink.cmp',
        version = '^1.0.0',

        dependencies = {
            'rafamadriz/friendly-snippets',
        },

        config = function()
            require('blink.cmp').setup({
                snippets = { preset = 'luasnip' },
                signature = { enabled = true },
                appearance = {
                    use_nvim_cmp_as_default = false,
                    nerd_font_variant = 'normal',
                },
                sources = {
                    default = { 'lsp', 'path', 'snippets', 'buffer' },
                    providers = {
                        cmdline = {
                            min_keyword_length = 2,
                        },
                    },
                },
                keymap = { preset = 'default' },
                cmdline = {
                    enabled = false,
                    completion = { menu = { auto_show = true } },
                    keymap = {
                        ['<CR>'] = { 'accept_and_enter', 'fallback' },
                    },
                },
                completion = {
                    menu = {
                        border = nil,
                        scrolloff = 1,
                        scrollbar = false,
                        draw = {
                            columns = {
                                { 'kind_icon' },
                                { 'label',      'label_description', gap = 1 },
                                { 'kind' },
                                { 'source_name' },
                            },
                        },
                    },
                    documentation = {
                        window = {
                            border = nil,
                            scrollbar = false,
                            winhighlight = 'Normal:BlinkCmpDoc,FloatBorder:BlinkCmpDocBorder,EndOfBuffer:BlinkCmpDoc',
                        },
                        auto_show = true,
                        auto_show_delay_ms = 250,
                    },
                },
                fuzzy = { implementation = 'prefer_rust_with_warning' }
            })

            require('luasnip.loaders.from_vscode').lazy_load()
        end,
    },
}
