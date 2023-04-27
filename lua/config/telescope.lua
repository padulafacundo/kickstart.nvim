local M = {}

function M.setup()
  require('telescope').setup {
    defaults = {
      file_ignore_patterns = { 'node_modules' },
      find_command = {'fd', '--hidden', '--type', 'f'},
    }
  }

  -- Enable telescope fzf native, if installed. This overrides
  -- telescope files_sorter and generic_sorter by default
  pcall(require('telescope').load_extension, 'fzf')

  -- See `:help telescope.builtin`
  local nmap = function(keys, func, opts)
    vim.keymap.set('n', keys, func, opts)
  end

  local builtin = require('telescope.builtin')
  -- find
  nmap('<leader>fb', builtin.buffers, { desc = '[F]ind existing [B]uffers' })
  nmap('<C-b>', builtin.buffers, { desc = '[F]ind existing [B]uffers' }) -- same as above
  nmap('<leader>ff', builtin.find_files, { desc = '[F]ind [F]iles' })
  nmap('<leader><space>', builtin.find_files, { desc = 'Find Buffers' }) -- same as above
  nmap('<C-p>', builtin.find_files, { desc = '[F]ind [F]iles' }) -- same as above
  nmap('<leader>sw', builtin.grep_string, { desc = '[S]earch current [W]ord' })
  nmap('<leader>fo', builtin.grep_string, { desc = '[F]ind [O]ccurrences' }) -- same as above
  nmap('<leader>sg', builtin.live_grep, { desc = '[S]earch by [G]rep' })
  nmap('<leader>fw', builtin.live_grep, { desc = '[F]ind [W]ord' })
  nmap('<leader>sd', builtin.diagnostics, { desc = '[S]earch [D]iagnostics' })
  nmap('<leader>ts', builtin.resume, { desc = '[T]elescope [R]esume' })

  -- git
  nmap('<leader>gc', builtin.git_commits, { desc = '[G]it [C]ommits' })
  nmap('<leader>gs', builtin.git_status, { desc = '[G]it [S]tatus' })

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
