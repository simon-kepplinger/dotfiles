local palette = require('config.theme.palette')
local syntax_highlights = require('config.theme.syntax')

return {
  'catppuccin/nvim',
  name = 'catppuccin',
  priority = 1000,

  opts = {
    flavour = 'mocha',
    transparent_background = true,
    color_overrides = {
      mocha = palette,
    },
    custom_highlights = syntax_highlights,
    default_integrations = true,
    integrations = {
      cmp = true,
      harpoon = true,
      mason = true,
    },
  },

  config = function(_, opts)
    require('catppuccin').setup(opts)
    vim.cmd.colorscheme('catppuccin')
  end,
}
