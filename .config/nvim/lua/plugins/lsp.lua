return {
  {
    'mason-org/mason-lspconfig.nvim',
    dependencies = {
      { 'mason-org/mason.nvim', opts = {} },
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
  },
}
