vim.pack.add({
	{ src = "https://github.com/nvim-mini/mini.surround", name = "mini-surround", version = "stable" },
	{ src = "https://github.com/nvim-mini/mini.statusline", name = "mini-statusline", version = "stable" },
	{ src = "https://github.com/nvim-mini/mini.move", name = "mini-move", version = "stable" },
	{ src = "https://github.com/nvim-mini/mini-git", name = "mini-git", version = "stable" },
	{ src = "https://github.com/echasnovski/mini.icons", name = "mini-icons", version = "stable" },
})

require("mini.surround").setup()
require("mini.statusline").setup()
require("mini.move").setup()
require("mini.git").setup()
require("mini.icons").setup()
