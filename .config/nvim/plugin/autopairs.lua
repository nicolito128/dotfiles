vim.pack.add({
	{
		src = "https://github.com/windwp/nvim-autopairs",
	},
})

require("nvim-autopairs").setup({
	map_cr = false, -- stop autopairs from mapping <CR> itself
})

vim.keymap.set("i", "<CR>", function()
	local blink_ok, blink = pcall(require, "blink.cmp")
	if blink_ok and blink.is_visible and blink.is_visible() then
		vim.schedule(function()
			blink.accept()
		end)
		return
	end

	local autopairs_ok, autopairs = pcall(require, "nvim-autopairs")
	if autopairs_ok then
		local keys = autopairs.autopairs_cr()
		vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(keys, true, true, true), "n", false)
		return
	end

	vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<CR>", true, true, true), "n", false)
end, { noremap = true })
