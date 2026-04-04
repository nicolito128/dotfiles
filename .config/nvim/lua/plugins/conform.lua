return {
  'stevearc/conform.nvim',
  event = { 'BufWritePre' },
  version = '*',
  cmd = { 'ConformInfo' },
  opts = {
    formatters_by_ft = {
      lua = { 'stylua' },
      go = {},
      javascript = { { 'prettierd', 'prettier' } },
    },
    format_on_save = function(bufnr)
      local ft = vim.bo[bufnr].filetype
      if ft == 'go' then
        vim.lsp.buf.code_action({
          context = { only = { 'source.organizeImports' } },
          apply = true
        })
      end
      return { timeout_ms = 500, lsp_fallback = true }
    end,
  },
}
