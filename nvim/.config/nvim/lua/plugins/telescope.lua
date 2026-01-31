local builtin = require('telescope.builtin')
local actions = require('telescope.actions')

return {
  'nvim-telescope/telescope.nvim',
  tag = 'v0.2.0',
  dependencies = { 'nvim-lua/plenary.nvim' },

  opts = {
    defaults = {
      layout_strategy = 'vertical',
      layout_config = {
        prompt_position = 'top',
      },
      sorting_strategy = 'ascending',
      file_ignore_patterns = {
        'node_modules/',
        '%.git/',
        '%.github/',
        '%.angular/',
        'dist/',
        'target/',
        'coverage/',
      },
      mappings = {
        i = {
          ['<C-j>'] = actions.move_selection_next,
          ['<C-k>'] = actions.move_selection_previous,
          ['<C-s>'] = actions.select_horizontal,
        },
        n = {
          ['<C-j>'] = actions.move_selection_next,
          ['<C-k>'] = actions.move_selection_previous,
          ['<C-s>'] = actions.select_horizontal,
        },
      },
    },
    pickers = {
      find_files = { hidden = true, no_ignore = true },
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
      desc = 'Live Grep (git files only)',
    },
    {
      '<leader>fS',
      function()
        builtin.live_grep({
          additional_args = function()
            return { '--hidden', '--no-ignore' }
          end,
        })
      end,
      desc = 'Live Grep (all files)',
    },
    {
      '<leader>fb',
      builtin.buffers,
      desc = 'Find Buffers',
    },
    {
      '<leader>fk',
      builtin.keymaps,
      desc = 'Find Keymaps',
    },
  },
}
