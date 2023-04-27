-- UI plugins
--
return {
  -- Useful plugin to show you pending keybinds.
  { 'folke/which-key.nvim', opts = {} },

  -- Set lualine as statusline
  {
    'nvim-lualine/lualine.nvim',
    -- See `:help lualine.txt`
    opts = {
      options = {
        icons_enabled = true,
        theme = 'onedark',
        component_separators = '|',
        section_separators = '',
      },
      sections = {
        lualine_c = { { 'filename', path =  1 } },
      },
      inactive_sections = {
        lualine_c = { { 'filename', path =  1 } },
      },
    },
  },

  -- To enable icons the terminal should use a font that supports theme
  -- A possible configuration with iterm2 is to use a different font for
  -- non-ASCII characters

  -- Enable icons for file types, etc
  {
    'nvim-tree/nvim-web-devicons',
    config = function()
      require("nvim-web-devicons").setup {
        default = true
      }
    end
  }
}
