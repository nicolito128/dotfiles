vim.pack.add({
	{
		src = "https://github.com/stevearc/conform.nvim",
	},
})

require("conform").setup({
	formatters_by_ft = {
		lua = { "stylua" },
		go = { "goimports", "gofmt" },
		javascript = { "prettier", stop_after_first = true },
	},

	format_on_save = function(_)
		return {
			timeout_ms = 500,
			lsp_format = "fallback",
		}
	end,
})
