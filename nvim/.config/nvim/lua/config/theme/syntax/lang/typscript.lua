local build_syntax = require('config.theme.syntax.builder')

return function(c)
  return vim.tbl_extend('force', build_syntax('.typescript', c, {}), {})
end
