return {
  {
    'barrett-ruth/live-server.nvim',
    version = '*',
    build = 'pnpm add -g live-server',
    cmd = { 'LiveServerStart', 'LiveServerStop' },
    config = true,
  },
}
