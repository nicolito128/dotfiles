vim.api.nvim_create_autocmd("PackChanged", {
	callback = function(ev)
		local name, kind = ev.data.spec.name, ev.data.kind
		if name == "nvim-treesitter" and kind == "update" then
			if not ev.data.active then
				vim.cmd.packadd("nvim-treesitter")
			end
			vim.cmd("TSUpdate")
		end
	end,
})

vim.pack.add({
	{
		src = "https://github.com/nvim-treesitter/nvim-treesitter",
		name = "nvim-treesitter",
		version = "main",
	},
})

require("nvim-treesitter").setup({
	ensure_installed = { "lua", "luadoc", "vim", "vimdoc", "query", "markdown" },
	auto_install = true,
	highlight = {
		enable = true,
	},
})
