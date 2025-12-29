return {
  'NeogitOrg/neogit',
  lazy = true,
  dependencies = {
    'nvim-lua/plenary.nvim', -- required
    'sindrets/diffview.nvim', -- optional
    'nvim-telescope/telescope.nvim', -- optional
  },
  cmd = 'Neogit',
  opts = {
    log_date_format = '%d %b %Y %H:%M',
  },
  keys = {
    { '<leader>gg', '<cmd>Neogit<cr>', desc = 'Show Neogit UI' },
  },
}
