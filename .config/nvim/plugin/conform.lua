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

	format_on_save = function(bufnr)
		local filetype = vim.bo[bufnr].filetype
		local active_clients = vim.lsp.get_clients({ bufnr = bufnr })
		local format_with_lsp = "never"

		for _, client in ipairs(active_clients) do
			if client.supports_method("textDocument/formatting") then
				local lsp_filetypes = client.config.filetypes
				if lsp_filetypes then
					for _, ft in ipairs(lsp_filetypes) do
						if ft == filetype then
							format_with_lsp = "fallback"
							break
						end
					end
				end
			end
			if format_with_lsp == "fallback" then
				break
			end
		end

		return {
			timeout_ms = 750,
			lsp_format = format_with_lsp,
		}
	end,
})
