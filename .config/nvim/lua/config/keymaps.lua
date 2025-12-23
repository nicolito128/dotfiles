-- Key bindings and shortcuts
local mset = vim.keymap.set

-- Explorer
mset("n", "-", "<CMD>Oil --float<CR>", { desc = "Open parent directory with Oil" })

-- Copy to clipboard
mset('v', "<leader>y", '"+y')

-- Fast move with ctrl-up/down
mset('n', '<C-Down>', '5j', { noremap = true, silent = true })
mset('n', '<C-Up>', '5k', { noremap = true, silent = true })

mset('n', '<C-j>', '5j', { noremap = true, silent = true })
mset('n', '<C-k>', '5k', { noremap = true, silent = true })

mset('n', '<C-l>', '5l', { noremap = true, silent = true })
mset('n', '<C-h>', '5h', { noremap = true, silent = true })

-- Don't replace the content of buffer when pasting
mset("x", "p", "pgv\" . v:register . 'y'", { expr = true })

-- Go JSON tag
mset('n', '<leader>j', '_ywA<Space><Esc>pbeld$bguwciw"<Esc>pA"<Esc>F"<Ignore>ijson:<Esc>bi`<Esc>A`<Esc>_j',
  { noremap = true })

-- Ignore variable in Go/Zig
mset('n', '<leader>_', 'ebcw_', { noremap = true, desc = 'Replace word with _ (to ignore variable)' })

-- Toggle diagnostics
local diagnostic_enabled = true

local function toggle_diagnostics()
  diagnostic_enabled = not diagnostic_enabled
  vim.diagnostic.enable(diagnostic_enabled)
  print("Diagnostics " .. (diagnostic_enabled and "enabled" or "disabled"))
end

mset('n', '<leader>d', toggle_diagnostics, { noremap = true, silent = true })

-- Add ; to the end of the line in normal mode
mset('n', ';;', 'm`A;<Esc>``', { noremap = true, desc = 'Add ; to the end of the line' })
