-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
  local out = vim.fn.system({ 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { 'Failed to clone lazy.nvim:\n', 'ErrorMsg' },
      { out,                            'WarningMsg' },
      { '\nPress any key to exit...' },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

-- Setup lazy.nvim
require('lazy').setup({
  spec = {
    { import = 'plugins' },
  },
  install = { colorscheme = { 'catppuccin' } },
  checker = { enabled = true },
})

-- Auto format
local format_sync_grp = vim.api.nvim_create_augroup('GoImport', {})

vim.api.nvim_create_autocmd('BufWritePre', {
  pattern = '*',
  callback = function() vim.lsp.buf.format() end
})

vim.api.nvim_create_autocmd('BufWritePre', {
  pattern = '*.go',
  callback = function()
    vim.cmd('GoFmt')
  end,
  group = format_sync_grp,
})

-- Cmd
vim.cmd('cnoreabbrev W w')
vim.cmd('cnoreabbrev Q q')
