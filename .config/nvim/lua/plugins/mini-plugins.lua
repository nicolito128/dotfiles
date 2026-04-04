return {
  {
    'echasnovski/mini.surround',
    version = '*',
    config = function()
      require('mini.surround').setup()
    end
  },
  {
    'echasnovski/mini.statusline',
    version = '*',
    config = function()
      require('mini.statusline').setup()
    end
  },
  {
    'echasnovski/mini.move',
    version = '*',
    config = function()
      require('mini.move').setup()
    end
  },
  {
    'echasnovski/mini-git',
    version = '*',
    config = function()
      require('mini.git').setup()
    end
  },
  {
    'nvim-mini/mini.files',
    version = '*',
    config = function()
      require('mini.files').setup({
        window = {
          preview = true,
          width_focus = 30,
          width_preview = 30,
        },
      })

      vim.keymap.set("n", "-", function()
        local mf = require("mini.files")

        if not mf.close() then
          mf.open(vim.api.nvim_buf_get_name(0))
          if mf.reveal_current then
            mf.reveal_current()
          end
        end
      end, { desc = "Abrir mini.files" })
    end
  },
}
