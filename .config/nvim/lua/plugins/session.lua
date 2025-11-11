return {
  {
    "rmagatti/auto-session",
    lazy = false,

    ---enables autocomplete for opts
    ---@module "auto-session"
    opts = {
      suppressed_dirs = { "~/", "~/Downloads", "/" },
      git_use_branch_name = true,
    },
  },
}
