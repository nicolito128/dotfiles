return {
    {
        'L3MON4D3/LuaSnip',
        version = '^2.0.0',
        keys = {},
    },
    {
        'zbirenbaum/copilot.lua',
        config = function()
            require('copilot').setup({
                suggestion = { enabled = false },
                panel = { enabled = false },
            })
        end,
    },
    {
        'giuxtaposition/blink-cmp-copilot',
        after = { 'copilot.lua' },
    },
    {
        'saghen/blink.cmp',
        version = '^1.0.0',

        dependencies = {
            'rafamadriz/friendly-snippets',
            'giuxtaposition/blink-cmp-copilot',
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
                    default = { 'lsp', 'path', 'snippets', 'buffer', 'copilot' },
                    providers = {
                        cmdline = {
                            min_keyword_length = 2,
                        },
                        copilot = {
                            name = 'copilot',
                            module = 'blink-cmp-copilot',
                            score_offset = 75,
                            async = true,
                            timeout_ms = 3000,
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
