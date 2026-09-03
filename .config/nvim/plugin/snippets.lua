vim.pack.add({
	{ src = "https://github.com/L3MON4D3/LuaSnip" },
})

local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node

ls.add_snippets("go", {
	s("iferrn", {
		t({ "if err != nil {", "    return err", "}" }),
	}),
})
