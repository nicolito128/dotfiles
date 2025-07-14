-- Key bindings and shortcuts
local mset = vim.keymap.set

-- Explorer
mset("n", "-", "<CMD>Oil --float<CR>", { desc = "Open parent directory with Oil" })

-- Copy to clipboard
mset('v', "<leader>y", '"+y')

-- Don't replace the content of buffer when pasting
mset("x", "p", "pgv\" . v:register . 'y'", { expr = true })

-- Go JSON tag
mset('n', '<leader>j', '_ywA<Space><Esc>pbeld$bguwciw"<Esc>pA"<Esc>F"<Ignore>ijson:<Esc>bi`<Esc>A`<Esc>_j',
  { noremap = true })

-- Ignore variable in Go/Zig
mset('n', '<leader>_', 'ebcw_', { noremap = true, desc = 'Replace word with _ (to ignore variable)' })

-- Buffer handling
mset('n', '<leader>q', '<CMD>bnext<CR>', { noremap = true, desc = 'Go to the next buffer' })
mset('n', '<leader>w', '<CMD>bprevious<CR>', { noremap = true, desc = 'Go to the previous buffer' })
mset('n', '<leader>e', '<CMD>bdelete<CR>', { noremap = true, desc = 'Delete the current buffer' })
