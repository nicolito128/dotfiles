vim.lsp.enable({
	"gopls",
	"lua_ls",
})

vim.diagnostic.config({
	virtual_lines = true,
	virtual_text = true,
	underline = true,
	update_in_insert = false,
	severity_sort = true,
	float = {
		border = "rounded",
		source = true,
	},
	signs = {
		text = {
			[vim.diagnostic.severity.ERROR] = "󰅚 ",
			[vim.diagnostic.severity.WARN] = "󰀪 ",
			[vim.diagnostic.severity.INFO] = "󰋽 ",
			[vim.diagnostic.severity.HINT] = "󰌶 ",
		},
		numhl = {
			[vim.diagnostic.severity.ERROR] = "ErrorMsg",
			[vim.diagnostic.severity.WARN] = "WarningMsg",
		},
	},
})

vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("UserLspConfig", {}),
	callback = function(ev)
		local opts = { buffer = ev.buf, remap = false, silent = true }

		-- Go to declaration
		vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)

		-- Go to definition
		vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)

		-- Show documentation
		vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)

		-- Find reference
		vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)

		-- Rename symbols
		vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)

		-- Code actions
		vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)
	end,
})
