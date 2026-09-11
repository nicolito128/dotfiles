vim.pack.add({
	{
		src = "https://github.com/nvim-treesitter/nvim-treesitter",
		name = "nvim-treesitter",
		version = "main",
	},
})

require("nvim-treesitter").setup()

local ensure_installed = { "lua", "luadoc", "vim", "vimdoc", "query", "markdown" }

require("nvim-treesitter").install(ensure_installed)

-- Keep parsers updated after pack updates
vim.api.nvim_create_autocmd("PackChanged", {
	callback = function(ev)
		local name, kind = ev.data.spec.name, ev.data.kind
		if name == "nvim-treesitter" and kind == "update" then
			if not ev.data.active then
				vim.cmd.packadd("nvim-treesitter")
			end
			require("nvim-treesitter").update()
		end
	end,
})
