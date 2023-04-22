local M = {}

function M.setup()
  -- alias for Git blame
  vim.cmd('command! Gblame Git blame')
end

return M
