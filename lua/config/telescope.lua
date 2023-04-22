local M = {}

function M.setup()
  local actions = require('telescope.actions')

  require('telescope').setup {
    defaults = {
      mappings = {
        i = {
          ['<esc>'] = actions.close,
        },
      },
      file_ignore_patterns = { 'node_modules' },
    }
  }

  -- Enable telescope fzf native, if installed
  pcall(require('telescope').load_extension, 'fzf')

  -- See `:help telescope.builtin`
  local nmap = function(keys, func, opts)
    vim.keymap.set('n', keys, func, opts)
  end

  local builtin = require('telescope.builtin')
  -- find
  nmap('<leader>fb', builtin.buffers, { desc = '[F]ind existing [B]uffers' })
  nmap('<leader><space>', builtin.buffers, { desc = '[F]ind existing [B]uffers' }) -- same as above
  nmap('<C-b>', builtin.buffers, { desc = '[F]ind existing [B]uffers' }) -- same as above
  nmap('<leader>ff', builtin.find_files, { desc = '[F]ind [F]iles' })
  nmap('<C-p>', builtin.find_files, { desc = '[F]ind [F]iles' }) -- same as above
  nmap('<leader>sw', builtin.grep_string, { desc = '[S]earch current [W]ord' })
  nmap('<leader>gs', builtin.grep_string, { desc = '[G]rep [S]tring' }) -- same as above
  nmap('<leader>sg', builtin.live_grep, { desc = '[S]earch by [G]rep' })
  nmap('<leader>sd', builtin.diagnostics, { desc = '[S]earch [D]iagnostics' })

  -- git
  nmap('<leader>gc', builtin.git_commits, { desc = '[G]it [C]ommits' })
  nmap('<leader>gs', builtin.git_commits, { desc = '[G]it [S]tatus' })

  nmap('<leader>/', function()
    -- You can pass additional configuration to telescope to change theme, layout, etc.
    builtin.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
      winblend = 10,
      previewer = false,
    })
  end, { desc = '[/] Fuzzily search in current buffer' })
  nmap('<leader>?', builtin.oldfiles, { desc = '[?] Find recently opened files' })
end

return M