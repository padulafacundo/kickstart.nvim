-- Git related plugins
return {
  {
    'tpope/vim-fugitive',
    config = function()
      require('config.vim-fugitive').setup()
    end,
  },

  'tpope/vim-rhubarb',

  { -- Adds git releated signs to the gutter, as well as utilities for managing changes
    'lewis6991/gitsigns.nvim',
    opts = {
      -- See `:help gitsigns.txt`
      signs = {
        add = { text = '+' },
        change = { text = '~' },
        delete = { text = '_' },
        topdelete = { text = '‾' },
        changedelete = { text = '~' },
      },
    },
  },
}
