vim.pack.add({
	{
		src = "https://github.com/windwp/nvim-autopairs",
	},
})

require("nvim-autopairs").setup({
	map_cr = false, -- IMPORTANT: stop autopairs from mapping <CR> itself
})

-- Chain: blink.cmp accept -> autopairs completion-aware bracket insert -> fallback
vim.keymap.set("i", "<CR>", function()
	local blink_ok, blink = pcall(require, "blink.cmp")
	if blink_ok and blink.is_visible and blink.is_visible() then
		if blink.accept() then
			return
		end
	end

	local autopairs_ok, autopairs = pcall(require, "nvim-autopairs")
	if autopairs_ok then
		return autopairs.autopairs_cr()
	end

	-- final fallback
	return vim.api.nvim_replace_termcodes("<CR>", true, true, true)
end, { expr = true, noremap = true })
