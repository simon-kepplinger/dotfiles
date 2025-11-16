local build_syntax = require('config.theme.syntax.builder')
local with_suffix = require('util.suffix')

-- TODO finish color schema
return function(c)
  local key = '.elixir'

  local purple = '#9084ff'
  local teal = '#8fc7ff'

  return vim.tbl_extend(
    'force',
    build_syntax(key, c, {
      keyword = { fg = purple },
      ['function'] = { fg = teal },
    }),
    with_suffix(key, {
      ['@module'] = { fg = c.text },
    })
  )
end
