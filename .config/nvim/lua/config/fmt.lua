vim.api.nvim_create_autocmd("BufWritePre", {
	pattern = "*",
	callback = function(args)
		local bufnr = args.buf
		local ft = vim.bo[bufnr].filetype

		vim.lsp.buf.format({
			bufnr = bufnr,
			async = false,
			filter = function(client)
				if not client.supports_method("textDocument/formatting") then
					return false
				end

				local client_ft = client.config.filetypes or {}
				for _, filter_ft in ipairs(client_ft) do
					if filter_ft == ft then return true end
				end

				return false
			end,
		})
	end,
})
