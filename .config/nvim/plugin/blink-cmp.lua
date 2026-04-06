vim.pack.add({
	{ src = "https://github.com/zbirenbaum/copilot.lua" },
	{ src = "https://github.com/giuxtaposition/blink-cmp-copilot" },
	{ src = "https://github.com/L3MON4D3/LuaSnip" },
	{ src = "https://github.com/saghen/blink.cmp" },
	{ src = "https://github.com/rafamadriz/friendly-snippets" },
})

require("copilot").setup({
	suggestion = { enabled = false },
	panel = { enabled = false },
	filetypes = {
		["*"] = false,
	},
})

require("blink.cmp").setup({
	snippets = { preset = "luasnip" },
	signature = { enabled = true },
	appearance = {
		use_nvim_cmp_as_default = false,
		nerd_font_variant = "normal",
		kind_icons = {
			Copilot = "",
		},
	},
	sources = {
		default = { "lsp", "path", "snippets", "buffer", "copilot" },
		providers = {
			copilot = {
				name = "copilot",
				module = "blink-cmp-copilot",
				score_offset = 100,
				async = true,
			},
			cmdline = {
				min_keyword_length = 2,
			},
		},
	},
	keymap = { preset = "default" },
	cmdline = {
		enabled = false,
		completion = { menu = { auto_show = true } },
		keymap = {
			["<CR>"] = { "accept_and_enter", "fallback" },
		},
	},
	completion = {
		menu = {
			border = nil,
			scrolloff = 1,
			scrollbar = false,
			draw = {
				columns = {
					{ "kind_icon" },
					{ "label", "label_description", gap = 1 },
					{ "kind" },
					{ "source_name" },
				},
			},
		},
		documentation = {
			window = {
				border = nil,
				scrollbar = false,
				winhighlight = "Normal:BlinkCmpDoc,FloatBorder:BlinkCmpDocBorder,EndOfBuffer:BlinkCmpDoc",
			},
			auto_show = true,
			auto_show_delay_ms = 150,
		},
	},
	fuzzy = { implementation = "prefer_rust_with_warning" },
})

require("luasnip.loaders.from_vscode").lazy_load()

_G.copilot_status = false
function _G.ToggleCopilot()
	if not _G.copilot_status then
		vim.cmd("Copilot! setup")
		vim.cmd("Copilot! attach")
		print("Copilot Activated 🤖")
		_G.copilot_status = true
	else
		vim.cmd("Copilot! detach")
		print("Copilot Deactivated 💤")
		_G.copilot_status = false
	end
	vim.cmd("redrawstatus")
end

vim.api.nvim_create_user_command("CopilotToggle", ToggleCopilot, {})
vim.keymap.set("n", "<leader>cp", ToggleCopilot, { desc = "Toggle Copilot IA" })
