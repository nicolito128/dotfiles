-- Key bindings and shortcuts

local mset = vim.keymap.set

-- Explorer
mset("n", "-", "<CMD>Oil --float<CR>", { desc = "Open parent directory with Oil" })

-- Copy to clipboard
mset('v', "<leader>y", '"+y')

-- Don't replace the content of buffer when pasting
mset("x", "p", "pgv\" . v:register . 'y'", { expr = true })

-- Go JSON tag
mset('n', '<leader>j', '_ywA<Space><Esc>pbeld$bguwciw"<Esc>pA"<Esc>F"<Ignore>ijson:<Esc>bi`<Esc>A`<Esc>_j', { noremap = true})

