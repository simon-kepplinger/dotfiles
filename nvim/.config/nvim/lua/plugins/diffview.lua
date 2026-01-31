return {
  {
    'sindrets/diffview.nvim',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-tree/nvim-web-devicons',
    },
    cmd = {
      'DiffviewOpen',
      'DiffviewClose',
      'DiffviewToggleFiles',
      'DiffviewFocusFiles',
      'DiffviewFileHistory',
    },
    config = function()
      require('diffview').setup({
        file_panel = {
          win_config = {
            position = 'bottom',
            height = 12,
          },
        },
      })
    end,
  },
}
