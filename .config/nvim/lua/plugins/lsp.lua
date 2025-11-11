return {
  {
    'mason-org/mason-lspconfig.nvim',
    version = '^2.0.0',

    dependencies = {
      { 'mason-org/mason.nvim', opts = {} },
      'neovim/nvim-lspconfig',
    },

    opts = {
      ensure_installed = {
        -- Lua
        'lua_ls',
        -- Go
        'gopls',
        -- Rust
        'rust_analyzer',
        -- Bash
        'bashls',
        -- C, Meson, Clang
        'clangd',
        'mesonlsp',
        -- BEAM (Erlang, Elixir)
        'elp',
        'elixirls',
        -- Python
        'pylsp',
        -- Markdown
        'marksman',
        -- JSON
        'jsonls',
        -- Web (PHP, HTML, CSS, JS/TS, ...)
        'phpactor',
        'laravel_ls',
        'html',
        'cssls',
        'ts_ls',
        'tailwindcss',
        'eslint',
        -- Containers
        'dockerls',
      },
    },
  },
}
