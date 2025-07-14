return {
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
    dependencies = {
      'rafamadriz/friendly-snippets',
      'giuxtaposition/blink-cmp-copilot',
    },

    version = '1.4.*',

    opts = {
      keymap = { preset = 'default' },
      appearance = { nerd_font_variant = 'mono' },

      completion = {
        documentation = { auto_show = false },
        trigger = {
          show_on_keyword = true,
        },
      },

      sources = {
        default = { 'lsp', 'path', 'snippets', 'buffer', 'copilot' },
        providers = {
          copilot = {
            name = 'copilot',
            module = 'blink-cmp-copilot',
            score_offset = 100,
            async = true,
          },
        },
      },

      fuzzy = { implementation = 'prefer_rust_with_warning' }
    },
  },
}
