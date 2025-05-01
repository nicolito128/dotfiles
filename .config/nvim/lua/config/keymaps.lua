-- Key bindings and shortcuts

-- Explorer
vim.keymap.set("n", "-", "<CMD>Oil --float<CR>", { desc = "Open parent directory with Oil" })

-- Copy to clipboard
vim.keymap.set('v', "<leader>y", '"+y')

-- Don't replace the content of buffer when pasting
vim.keymap.set("x", "p", "pgv\" . v:register . 'y'", { expr = true })
