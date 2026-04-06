vim.pack.add({
	{
		src = "https://github.com/vague2k/vague.nvim",
	},
})

require("vague").setup()

vim.cmd("silent! colorscheme vague")
