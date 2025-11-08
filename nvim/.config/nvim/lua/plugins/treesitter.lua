return {
  'nvim-treesitter/nvim-treesitter',
  build = ':TSUpdate',

  opts = {
    ensure_installed = {
      'vim',
      'vimdoc',
      'help',
      'query',
      'bash',
      'lua',
      'html',
      'markdown',
      'javascript',
      'typescript',
      'c',
      'rust',
    },
    sync_install = false,
    auto_install = true,
    highlight = { enable = true, additional_vim_regex_highlighting = false },
    indent = { enable = true },
    ignore_install = {},
    modules = {},
    config = function(_, opts)
      require('nvim-treesitter.configs').setup(opts)
    end,
  },
}
