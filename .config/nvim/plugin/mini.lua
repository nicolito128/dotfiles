vim.pack.add({
	{ src = "https://github.com/nvim-mini/mini.files", name = "mini-files", version = "stable" },
	{ src = "https://github.com/nvim-mini/mini.surround", name = "mini-surround", version = "stable" },
	{ src = "https://github.com/nvim-mini/mini.statusline", name = "mini-statusline", version = "stable" },
	{ src = "https://github.com/nvim-mini/mini.move", name = "mini-move", version = "stable" },
	{ src = "https://github.com/nvim-mini/mini-git", name = "mini-git", version = "stable" },
})

require("mini.files").setup()
require("mini.surround").setup()
require("mini.statusline").setup()
require("mini.move").setup()
require("mini.git").setup()

vim.keymap.set("n", "-", function()
	local mf = require("mini.files")
	if not mf.close() then
		mf.open(vim.api.nvim_buf_get_name(0))
	end
end, { desc = "Open file explorer" })
