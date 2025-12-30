return {
  'NeogitOrg/neogit',
  lazy = true,
  dependencies = {
    'nvim-lua/plenary.nvim',
    'sindrets/diffview.nvim',
    'nvim-telescope/telescope.nvim',
  },
  cmd = 'Neogit',
  opts = {
    kind = 'split',

    floating = {
      relative = 'editor',
      width = 0.95,
      height = 0.95,
      style = 'minimal',
      border = 'rounded',
    },

    log_date_format = '%d %b %Y %H:%M',

    commit_editor = { kind = 'floating' },
    commit_select_view = { kind = 'floating' },
    log_view = { kind = 'floating' },
    reflog_view = { kind = 'floating' },
    refs_view = { kind = 'floating' },
    stash = { kind = 'floating' },
    popup = { kind = 'floating' },
  },
  keys = {
    { '<leader>gg', '<cmd>Neogit<cr>', desc = 'Show Neogit UI' },
  },
}
