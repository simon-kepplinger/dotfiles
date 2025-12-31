return {
  {
    'github/copilot.vim',
    cmd = 'Copilot',
    event = { 'BufReadPost', 'BufNewFile' },

    init = function()
      vim.g.copilot_no_tab_map = true
      vim.g.copilot_assume_mapped = true
    end,

    config = function()
      vim.keymap.set('i', '<M-y>', 'copilot#Accept("\\<CR>")', {
        expr = true,
        replace_keycodes = false,
        silent = true,
        desc = 'Copilot: accept suggestion',
      })

      vim.keymap.set('i', '<M-w>', '<Plug>(copilot-accept-word)', {
        remap = true,
        silent = true,
        desc = 'Copilot: accept word',
      })

      vim.keymap.set('i', '<M-l>', '<Plug>(copilot-accept-line)', {
        remap = true,
        silent = true,
        desc = 'Copilot: accept line',
      })

      vim.keymap.set('i', '<M-d>', '<Plug>(copilot-dismiss)', {
        remap = true,
        silent = true,
        desc = 'Copilot: dismiss suggestion',
      })

      vim.keymap.set('i', '<M-s>', '<Plug>(copilot-suggest)', {
        remap = true,
        silent = true,
        desc = 'Copilot: suggest now',
      })

      vim.keymap.set('i', '<M-n>', '<Plug>(copilot-next)', {
        remap = true,
        silent = true,
        desc = 'Copilot: next suggestion',
      })

      vim.keymap.set('i', '<M-p>', '<Plug>(copilot-previous)', {
        remap = true,
        silent = true,
        desc = 'Copilot: previous suggestion',
      })
    end,
  },
}
