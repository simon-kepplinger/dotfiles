return {
  'folke/which-key.nvim',
  event = 'VeryLazy',
  opts = {
    delay = 500,
    win = {
      border = 'rounded',
      padding = { 1, 2 },
      title = true,
      title_pos = 'center',
    },
  },
  keys = {
    {
      '<leader>?',
      function()
        require('which-key').show({ global = false })
      end,
      desc = 'Buffer Local Keymaps (which-key)',
    },
  },
}
