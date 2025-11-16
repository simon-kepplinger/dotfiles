local with_suffix = require('util.suffix')

---@class SyntaxTheme
---@field variable?      table
---@field keyword?       table
---@field constant?      table
---@field macro?         table
---@field label?         table
---@field string?        table
---@field special?       table
---@field character?     table
---@field special_char?  table
---@field boolean?       table
---@field number?        table
---@field float?         table
---@field type?          table
---@field function?      table
---@field operator?      table
---@field include?       table
---@field repeat_?       table
---@field exception?     table
---@field conditional?   table
---@field preproc?       table
---@field define?        table
---@field delimiter?     table

---@param key string
---@param c table
---@param theme SyntaxTheme
return function(key, c, theme)
  local variable = theme.variable or { fg = c.text }
  local keyword = theme.keyword or { link = 'Keyword' }
  local constant = theme.constant or { link = 'Constant' }
  local macro = theme.macro or { link = 'Macro' }
  local label = theme.label or { link = 'Label' }
  local string_ = theme.string or { link = 'String' }
  local special = theme.special or { link = 'Special' }
  local character = theme.character or { link = 'Character' }
  local special_char = theme.special_char or { link = 'SpecialChar' }
  local boolean_hl = theme.boolean or { link = 'Boolean' }
  local number = theme.number or { link = 'Number' }
  local float = theme.float or { link = 'Float' }
  local type_hl = theme.type or { link = 'Type' }
  local func = theme['function'] or { link = 'Function' }
  local operator = theme.operator or { link = 'Operator' }
  local include = theme.include or { link = 'Include' }
  local repeat_hl = theme.repeat_ or { link = 'Repeat' }
  local exception = theme.exception or { link = 'Exception' }
  local conditional = theme.conditional or { link = 'Conditional' }
  local preproc = theme.preproc or { link = 'PreProc' }
  local define = theme.define or { link = 'Define' }
  local delimiter = theme.delimiter or { link = 'Delimiter' }

  local syntax = {
    -- Identifiers
    ['@variable'] = variable,
    ['@variable.builtin'] = keyword,
    ['@variable.parameter'] = variable,
    ['@variable.member'] = variable,

    ['@constant'] = constant,
    ['@constant.builtin'] = keyword,
    ['@constant.macro'] = macro,

    ['@module'] = { fg = c.yellow, style = { 'italic' } },
    ['@label'] = label,

    -- Literals
    ['@string'] = string_,
    ['@string.documentation'] = { fg = c.teal },
    ['@string.regexp'] = { fg = c.pink },
    ['@string.escape'] = { fg = c.pink },
    ['@string.special'] = special,
    ['@string.special.path'] = special,
    ['@string.special.symbol'] = { fg = c.flamingo },
    ['@string.special.url'] = { fg = c.blue, style = { 'italic', 'underline' } },
    ['@punctuation.delimiter.regex'] = { link = '@string.regexp' },

    ['@character'] = character,
    ['@character.special'] = special_char,

    ['@boolean'] = boolean_hl,
    ['@number'] = number,
    ['@number.float'] = float,

    -- Types
    ['@type'] = type_hl,
    ['@type.builtin'] = keyword,
    ['@type.definition'] = type_hl,

    ['@attribute'] = constant,
    ['@property'] = { fg = c.text },

    -- Functions
    ['@function'] = func,
    ['@function.builtin'] = { fg = c.peach },
    ['@function.call'] = func,
    ['@function.macro'] = { fg = c.pink },

    ['@function.method'] = func,
    ['@function.method.call'] = func,

    ['@constructor'] = keyword,
    ['@operator'] = operator,

    -- Keywords
    ['@keyword'] = keyword,
    ['@keyword.modifier'] = keyword,
    ['@keyword.type'] = keyword,
    ['@keyword.coroutine'] = keyword,
    ['@keyword.function'] = func,
    ['@keyword.operator'] = operator,
    ['@keyword.import'] = include,
    ['@keyword.repeat'] = repeat_hl,
    ['@keyword.return'] = keyword,
    ['@keyword.debug'] = exception,
    ['@keyword.exception'] = exception,

    ['@keyword.conditional'] = conditional,
    ['@keyword.conditional.ternary'] = operator,

    ['@keyword.directive'] = preproc,
    ['@keyword.directive.define'] = define,

    -- JS & derivative
    ['@keyword.export'] = keyword,

    -- Punctuation
    ['@punctuation.delimiter'] = delimiter,
    ['@punctuation.bracket'] = { fg = c.overlay2 },
    ['@punctuation.special'] = special,
  }

  return with_suffix(key, syntax)
end
