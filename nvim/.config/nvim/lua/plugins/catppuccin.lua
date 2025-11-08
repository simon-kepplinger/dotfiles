local palette = require('config.theme.palette')
local custom_highlights = require('config.theme.syntax-highlight')

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
    custom_highlights = function(colors)
      return {
        WinSeparator = { fg = colors.blue },
        CursorLine = { bg = colors.crust },
        ['@keyword.modifier.typescript'] = { fg = colors.teal, style = {} }, -- e.g. public, private, readonly
        ['@lsp.type.keyword.modifier'] = { fg = colors.teal, style = {} }, -- e.g. public, private, readonly
        ['@keyword.modifier'] = { fg = colors.teal, style = {} }, -- e.g. public, private, readonly
        Keyword = { fg = colors.teal, style = {} }, -- e.g. public, private, readonly
      }
    end,
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
    vim.api.nvim_set_hl(0, '@keyword.modifier', { fg = '#14b8a6' }) -- sample teal hex
  end,
}
