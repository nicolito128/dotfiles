vim.pack.add({
	{
		src = "https://github.com/lewis6991/gitsigns.nvim",
	},
	{
		src = "https://github.com/nvim-tree/nvim-web-devicons",
	},
	{
		src = "https://github.com/romgrk/barbar.nvim",
	},
})

require("nvim-web-devicons").setup()
require("gitsigns").setup()
require("barbar").setup({
	animation = false,
})

vim.g.barbar_auto_setup = false

vim.keymap.set("n", "<A-,>", "<Cmd>BufferPrevious<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<A-.>", "<Cmd>BufferNext<CR>", { noremap = true, silent = true })

vim.keymap.set("n", "<A-<>", "<Cmd>BufferMovePrevious<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<A->>", "<Cmd>BufferMoveNext<CR>", { noremap = true, silent = true })

vim.keymap.set("n", "<A-1>", "<Cmd>BufferGoto 1<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<A-2>", "<Cmd>BufferGoto 2<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<A-3>", "<Cmd>BufferGoto 3<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<A-4>", "<Cmd>BufferGoto 4<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<A-5>", "<Cmd>BufferGoto 5<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<A-6>", "<Cmd>BufferGoto 6<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<A-7>", "<Cmd>BufferGoto 7<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<A-8>", "<Cmd>BufferGoto 8<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<A-9>", "<Cmd>BufferGoto 9<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<A-0>", "<Cmd>BufferLast<CR>", { noremap = true, silent = true })

vim.keymap.set("n", "<A-p>", "<Cmd>BufferPin<CR>", { noremap = true, silent = true })

vim.keymap.set("n", "<A-c>", "<Cmd>BufferClose<CR>", { noremap = true, silent = true })

vim.keymap.set("n", "<C-p>", "<Cmd>BufferPick<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<C-s-p>", "<Cmd>BufferPickDelete<CR>", { noremap = true, silent = true })

vim.keymap.set("n", "<Space>bb", "<Cmd>BufferOrderByBufferNumber<CR>", { noremap = true, silent = true })

vim.keymap.set("n", "<Space>bn", "<Cmd>BufferOrderByName<CR>", { noremap = true, silent = true })

vim.keymap.set("n", "<Space>bd", "<Cmd>BufferOrderByDirectory<CR>", { noremap = true, silent = true })

vim.keymap.set("n", "<Space>bl", "<Cmd>BufferOrderByLanguage<CR>", { noremap = true, silent = true })

vim.keymap.set("n", "<Space>bw", "<Cmd>BufferOrderByWindowNumber<CR>", { noremap = true, silent = true })
