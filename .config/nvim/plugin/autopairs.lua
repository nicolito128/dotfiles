vim.pack.add({
	{
		src = "https://github.com/windwp/nvim-autopairs",
	},
})

require("nvim-autopairs").setup({
	map_cr = false,
})

vim.keymap.set("i", "<CR>", function()
	local ok, autopairs = pcall(require, "nvim-autopairs")
	if ok then
		return autopairs.autopairs_cr()
	end
	return vim.api.nvim_replace_termcodes("<CR>", true, true, true)
end, { expr = true, noremap = true, replace_keycodes = false })
