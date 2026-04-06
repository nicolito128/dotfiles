vim.api.nvim_create_autocmd("BufWritePre", {
	pattern = "*",
	callback = function()
		vim.lsp.buf.format()
	end,
})

vim.api.nvim_create_autocmd("BufWritePre", {
	pattern = "*.go",
	callback = function()
		vim.lsp.buf.format({ async = false })
	end,
})
