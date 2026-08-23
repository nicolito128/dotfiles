vim.pack.add({
	"https://github.com/nvim-lua/plenary.nvim",
	"https://github.com/stevearc/dressing.nvim", -- optional for vim.ui.select
	"https://github.com/nvim-flutter/flutter-tools.nvim",
})

require("flutter-tools").setup({})
