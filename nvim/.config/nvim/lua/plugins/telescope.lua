local builtin = require('telescope.builtin')
local actions = require('telescope.actions')

return {
  'nvim-telescope/telescope.nvim',
  tag = '0.1.8',
  dependencies = { 'nvim-lua/plenary.nvim' },

  opts = {
    defaults = {
      file_ignore_patterns = { 'node_modules', '.git' },
      mappings = {
        i = {
          ['<C-j>'] = actions.move_selection_next,
          ['<C-k>'] = actions.move_selection_previous,
        },
        n = {
          ['<C-j>'] = actions.move_selection_next,
          ['<C-k>'] = actions.move_selection_previous,
        },
      },
    },
    pickers = {
      find_files = { hidden = true },
      git_files = { hidden = true },
      live_grep = {
        additional_args = function()
          return { '--hidden' }
        end,
      },
    },
  },

  keys = {
    {
      '<leader>ff',
      builtin.find_files,
      desc = 'Find Files',
    },
    {
      '<leader>fg',
      builtin.git_files,
      desc = 'Find Git Files',
    },
    {
      '<leader>fs',
      builtin.live_grep,
      desc = 'File Search (Grep)',
    },
    {
      '<leader>fb',
      builtin.buffers,
      desc = 'Find Buffers',
    },
  },
}
