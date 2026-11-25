local M = {}

function M.setup()
  -- See `:help nvim-treesitter`
  -- Add languages to be installed here that you want installed for treesitter
  local parsers = { 'lua', 'vim', 'vimdoc', 'ruby', 'javascript', 'typescript', 'tsx', 'python', 'go', 'kotlin' }
  local installed = require('nvim-treesitter.config').get_installed()
  local installed_set = {}
  for _, p in ipairs(installed) do
    installed_set[p] = true
  end
  local missing = vim.tbl_filter(function(p) return not installed_set[p] end, parsers)
  if #missing > 0 then
    require('nvim-treesitter.install').install(missing)
  end

  -- Enable treesitter highlighting for all installed parsers
  vim.api.nvim_create_autocmd('FileType', {
    callback = function()
      pcall(vim.treesitter.start)
    end,
  })
end

return M
