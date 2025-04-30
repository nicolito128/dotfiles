local vim = vim
local Plug = vim.fn['plug#']

vim.g.mapleader = '\\'
vim.g.maplocalleader = '\\'

-- Basic settings
vim.o.number = true -- Enable line numbers
vim.o.tabstop = 4 -- Number of spaces a tab represents
vim.o.shiftwidth = 4 -- Number of spaces for each indentation
vim.o.expandtab = true -- Convert tabs to spaces
vim.o.smartindent = true -- Automatically indent new lines
vim.o.wrap = false -- Disable line wrapping
vim.o.cursorline = true -- Highlight the current line
vim.o.termguicolors = true -- Enable 24-bit RGB colors

-- Spell check
vim.o.spelllang="en_us,es"

-- Syntax highlighting and filetype plugins
vim.cmd('syntax enable')
vim.cmd('filetype plugin indent on')

-- Plugins
vim.call('plug#begin')

-- Themes and styles
Plug 'catppuccin/nvim'

-- LSP utils
Plug 'neovim/nvim-lspconfig'
Plug'williamboman/mason.nvim'
Plug 'williamboman/mason-lspconfig.nvim'

-- Completions
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'
Plug 'L3MON4D3/LuaSnip'
Plug 'saadparwaiz1/cmp_luasnip'

-- File tree
Plug 'preservim/nerdtree'
Plug 'ryanoasis/vim-devicons'

-- Syntax Highlight
Plug 'nvim-treesitter/nvim-treesitter'

-- Utils
Plug 'echasnovski/mini.nvim'
Plug "OXY2DEV/markview.nvim"
Plug "OXY2DEV/oops.nvim"
Plug "OXY2DEV/patterns.nvim"

vim.call('plug#end')

-- Setting theme
-- catppuccin-latte, catppuccin-frappe, catppuccin-macchiato, catppuccin-mocha
vim.cmd('silent! colorscheme catppuccin')

-- LSP
local lspconfig = require('lspconfig')

require("mason").setup()
require('mason-lspconfig').setup({
  ensure_installed = {'gopls'},
  handlers = {
    function(server)
      lspconfig[server].setup({
        capabilities = lsp_capabilities,
      })
    end,
  }
})

-- Utils
--- Ref: https://github.com/echasnovski/mini.nvim
require('mini.pairs').setup()
require('mini.move').setup()
require('mini.git').setup()

require('markview').setup()
require('oops').setup()
require('patterns').setup()

-- Auto completion with cmp
local cmp = require('cmp')
local luasnip = require('luasnip')

local select_opts = {behavior = cmp.SelectBehavior.Select}
local has_words_before = function()
  if vim.api.nvim_buf_get_option(0, "buftype") == "prompt" then return false end
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_text(0, line-1, 0, line-1, col, {})[1]:match("^%s*$") == nil
end

--- See :help cmp-config
cmp.setup({
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end
  },
  sources = {
    {name = 'path'},
    {name = 'nvim_lsp', keyword_length = 3},
    {name = 'buffer', keyword_length = 3},
    {name = 'luasnip', keyword_length = 2},
		{name = 'copilot', group_index = 2}
    },
  formatting = {
    fields = {'menu', 'abbr', 'kind'},
    format = function(entry, item)
      local menu_icon = {
        nvim_lsp = 'λ',
        luasnip = 'α',
        buffer = 'Ω',
        path = 'ϴ',
      }

      item.menu = menu_icon[entry.source.name]
      return item
    end,
  },
  -- See :help cmp-mapping
  mapping = {
    ['<Up>'] = cmp.mapping.select_prev_item(select_opts),
    ['<Down>'] = cmp.mapping.select_next_item(select_opts),

    ['<C-p>'] = cmp.mapping.select_prev_item(select_opts),
    ['<C-n>'] = cmp.mapping.select_next_item(select_opts),

    ['<C-u>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),

    ['<C-e>'] = cmp.mapping.abort(),
    ['<CR>'] = cmp.mapping.confirm({select = false}),

    ['<C-d>'] = cmp.mapping(function(fallback)
      if luasnip.jumpable(1) then
        luasnip.jump(1)
      else
        fallback()
      end
    end, {'i', 's'}),

    ['<C-b>'] = cmp.mapping(function(fallback)
      if luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, {'i', 's'}),

    ['<Tab>'] = cmp.mapping(function(fallback)
      local col = vim.fn.col('.') - 1
      if cmp.visible() and has_words_before() then
        cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })
      elseif cmp.visible() then
        cmp.select_next_item(select_opts)
      elseif col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') then
        fallback()
      else
        cmp.complete()
      end
    end, {'i', 's'}),

    ['<S-Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item(select_opts)
      else
        fallback()
      end
    end, {'i', 's'}),
  },
})

-- Highlights
require('nvim-treesitter.configs').setup({
  -- A list of parser names, or "all" (the listed parsers MUST always be installed)
  ensure_installed = {'bash', 'c', 'html', 'css', 'javascript', 'typescript', 'lua', 'luadoc', 'markdown', 'vim', 'vimdoc', 'go', 'elixir', 'erlang', 'zig'},

  sync_install = false,

  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
})

-- Keybindings
local map = vim.keymap.set

map('v', "<leader>y", '"+y') -- Copy to clipboard
map('n', '<leader>n', '<cmd>:NERDTreeToggle<CR>') -- Open file tree
map('n', '<leader>m', '<cmd>:NERDTreeFocus<CR>') -- Focus file tree
