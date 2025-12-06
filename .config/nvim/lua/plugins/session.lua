return {
  {
    'rmagatti/auto-session',
    version = '^2.0.0',
    lazy = false,

    ---enables autocomplete for opts
    ---@module 'auto-session'
    opts = {
      suppressed_dirs = { '~/', '~/Workspaces', '~/Downloads', '/' },
      git_use_branch_name = true,
    },
  },
}
