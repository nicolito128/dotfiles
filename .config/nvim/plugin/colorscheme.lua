vim.pack.add({
	{
		src = "https://github.com/vague2k/vague.nvim",
	},
	{
		src = "https://github.com/mcauley-penney/techbase.nvim",
	},
})

require("vague").setup()

require("techbase").setup({
	italic_comments = false,
	transparent = false,
	hl_overrides = {},
})

vim.cmd("silent! colorscheme techbase")
