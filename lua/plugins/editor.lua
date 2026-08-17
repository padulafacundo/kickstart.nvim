-- Editor plugins

return {
  -- Fuzzy Finder (files, lsp, etc)
  -- ripgrep needs 'brew install ripgrep'
  -- fd needs 'brew install fd'
  {
    'nvim-telescope/telescope.nvim',
    version = '*',
    dependencies = { 'nvim-lua/plenary.nvim', 'BurntSushi/ripgrep', 'sharkdp/fd' },
    config = function()
      require('config.telescope').setup()
    end,
  },

  -- Fuzzy Finder Algorithm which requires local dependencies to be built.
  -- Only load if `make` is available. Make sure you have the system
  -- requirements installed.
  {
    'nvim-telescope/telescope-fzf-native.nvim',
    -- NOTE: If you are having trouble with this installation,
    --       refer to the README for telescope-fzf-native for more instructions.
    build = 'make',
    cond = function()
      return vim.fn.executable 'make' == 1
    end,
  },

  -- Highlight TODO comments, FIXME comments, etc
  {
    'folke/todo-comments.nvim',
    config = function()
      require('todo-comments').setup()
    end
  },

  -- Add indentation guides even on blank lines
  {
    'lukas-reineke/indent-blankline.nvim',
    main = "ibl",
    opts = {
      indent = { char = '┊' },
    },
  },

  -- Auto-inserts end-blocks (self-initializes on Neovim 0.9+)
  {
    'RRethy/nvim-treesitter-endwise',
    dependencies = { 'nvim-treesitter/nvim-treesitter' },
  },

  { 'tpope/vim-unimpaired' },
}
