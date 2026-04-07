vim.pack.add({
	{
		src = "https://github.com/mason-org/mason-lspconfig.nvim"
	},
	{
		src = "https://github.com/mason-org/mason.nvim"
	}
})

require("mason").setup({
	ensure_installed = {
		"lua_ls",
		"gopls",
		"clangd",
		"masonlsp",
		"bashls",
		"ts_ls"
	}
})

require("mason-lspconfig").setup({})
