local build_syntax = require('config.theme.syntax.builder')
local with_suffix = require('util.suffix')

return function(c)
  local key = '.elixir'

  local purple = '#8F83FF'
  local light_blue = '#8fc7ff'

  return vim.tbl_extend(
    'force',
    build_syntax(key, c, {
      keyword = { fg = purple },
      ['function'] = { fg = light_blue },
    }),
    with_suffix(key, {
      ['@module'] = { fg = c.teal },
      ['@string.special.symbol'] = { fg = c.yellow }, -- atoms
    })
  )
end
