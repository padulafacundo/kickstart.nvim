return {
  { -- Theme inspired by Atom
    'navarasu/onedark.nvim',
    priority = 1000,
    config = function()
      require('config.onedark').setup()
    end,
  },
}
