local build_syntax = require('config.theme.syntax.builder')
local with_suffix = require('util.suffix')

-- TODO get the semantics to work
return function(c)
  local key = '.rust'

  local rusty = '#d08770'

  return vim.tbl_extend(
    'force',
    build_syntax(key, c, {
      keyword = { fg = c.peach },
      type = { fg = c.maroon },
      ['function'] = { fg = rusty },
    }),
    with_suffix(key, {
      ['@lsp.type.function'] = { fg = c.maroon },
    })
  )
end
