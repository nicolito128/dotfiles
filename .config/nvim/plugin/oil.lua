vim.pack.add({
	{ src = "https://github.com/stevearc/oil.nvim", name = "oil", version = "stable" },
})

require("oil").setup({
	default_file_explorer = true,

	columns = {
		"icon",
	},

	view_options = {
		show_hidden = true,
	},

	keymaps = {
		["g?"] = "actions.show_help",
		["<CR>"] = "actions.select",

		["<C-v>"] = {
			"actions.select",
			opts = { vertical = true },
		},

		["<C-s>"] = {
			"actions.select",
			opts = { horizontal = true },
		},

		["-"] = {
			"actions.parent",
			mode = "n",
		},

		["_"] = {
			"actions.open_cwd",
			mode = "n",
		},

		["g."] = {
			"actions.toggle_hidden",
			mode = "n",
		},
	},
})

vim.keymap.set("n", "-", "<CMD>Oil<CR>", {
	desc = "Open file explorer",
})

vim.keymap.set("n", "<leader>e", function()
	vim.cmd("vsplit")
	vim.cmd("Vr 50")
	vim.cmd("Oil")
end, {
	desc = "Open a vertical split file explorer",
})
