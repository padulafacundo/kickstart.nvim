-- Highlight, edit, and navigate code
return {
  {
    'nvim-treesitter/nvim-treesitter',
    dependencies = {
      'nvim-treesitter/nvim-treesitter-textobjects',
    },
    build = ":TSUpdate",
    config = function()
      require('config.treesitter').setup()
    end,
  },
  {
    -- Highlight for .slim files
    'slim-template/vim-slim',
  }
}
