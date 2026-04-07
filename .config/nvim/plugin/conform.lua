vim.pack.add({
	{
		src = "https://github.com/stevearc/conform.nvim"
	}
})

require("conform").setup({
	formatters_by_ft = {
		lua = { "stylua" },
		go = {},
		javascript = { "prettier", stop_after_first = true }
	}
})
