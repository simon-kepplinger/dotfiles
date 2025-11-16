local typscript = require('config.theme.syntax.lang.typscript')
local elixir = require('config.theme.syntax.lang.elixir')
local rust = require('config.theme.syntax.lang.rust')

local build_syntax = require('config.theme.syntax.builder')

-- https://github.com/catppuccin/nvim/blob/da33755d00e09bff2473978910168ff9ea5dc453/lua/catppuccin/groups/treesitter.lua
-- to get the capture group of specific syntax use ':Inspect' on in
return function(c)
  local default = build_syntax('', c, {})

  return vim.tbl_extend('force', default, typscript(c), elixir(c), rust(c), {
    WinSeparator = { fg = c.blue },
    CursorLine = { bg = c.crust },

    Number = { fg = c.maroon },
    Boolean = { fg = c.maroon },
    Float = { link = 'Number' },
    Type = { fg = c.yellow },
    Function = { fg = c.teal },
    Operator = { fg = c.lavender },
    Keyword = { fg = c.lavender },
    Include = { fg = c.lavender },
    Conditional = { link = 'Keyword' },

    -- Comment
    ['@comment'] = { link = 'Comment' },
    ['@comment.documentation'] = { link = 'Comment' }, -- For comments documenting code

    ['@comment.error'] = { fg = c.base, bg = c.red },
    ['@comment.warning'] = { fg = c.base, bg = c.yellow },
    ['@comment.hint'] = { fg = c.base, bg = c.blue },
    ['@comment.todo'] = { fg = c.base, bg = c.flamingo },
    ['@comment.note'] = { fg = c.base, bg = c.rosewater },

    -- Markup
    ['@markup'] = { fg = c.text }, -- For strings considerated text in a markup language.
    ['@markup.strong'] = { fg = c.red, style = { 'bold' } }, -- bold
    ['@markup.italic'] = { fg = c.red, style = { 'italic' } }, -- italic
    ['@markup.strikethrough'] = { fg = c.text, style = { 'strikethrough' } }, -- strikethrough text
    ['@markup.underline'] = { link = 'Underlined' }, -- underlined text

    ['@markup.heading'] = { fg = c.blue }, -- titles like: # Example
    ['@markup.heading.markdown'] = { style = { 'bold' } }, -- bold headings in markdown, but not in HTML or other markup

    ['@markup.math'] = { fg = c.blue }, -- math environments (e.g. `$ ... $` in LaTeX)
    ['@markup.quote'] = { fg = c.pink }, -- block quotes
    ['@markup.environment'] = { fg = c.pink }, -- text environments of markup languages
    ['@markup.environment.name'] = { fg = c.blue }, -- text indicating the type of an environment

    ['@markup.link'] = { fg = c.lavender }, -- text references, footnotes, citations, etc.
    ['@markup.link.label'] = { fg = c.lavender }, -- link, reference descriptions
    ['@markup.link.url'] = { fg = c.blue, style = { 'italic', 'underline' } }, -- urls, links and emails

    ['@markup.raw'] = { fg = c.green }, -- used for inline code in markdown and for doc in python (""")

    ['@markup.list'] = { fg = c.teal },
    ['@markup.list.checked'] = { fg = c.green }, -- todo notes
    ['@markup.list.unchecked'] = { fg = c.overlay1 }, -- todo notes

    -- Diff
    ['@diff.plus'] = { link = 'diffAdded' }, -- added text (for diff files)
    ['@diff.minus'] = { link = 'diffRemoved' }, -- deleted text (for diff files)
    ['@diff.delta'] = { link = 'diffChanged' }, -- deleted text (for diff files)

    -- Tags
    ['@tag'] = { fg = c.blue }, -- Tags like HTML tag names.
    ['@tag.builtin'] = { fg = c.blue }, -- JSX tag names.
    ['@tag.attribute'] = { fg = c.yellow, style = { 'italic' } }, -- XML/HTML attributes (foo in foo="bar").
    ['@tag.delimiter'] = { fg = c.teal }, -- Tag delimiter like < > /

    -- Misc
    ['@error'] = { link = 'Error' },

    -- Language specific:

    -- Bash
    ['@function.builtin.bash'] = { fg = c.red, style = { 'italic' } },
    ['@variable.parameter.bash'] = { fg = c.green },

    -- markdown
    ['@markup.heading.1.markdown'] = { link = 'rainbow1' },
    ['@markup.heading.2.markdown'] = { link = 'rainbow2' },
    ['@markup.heading.3.markdown'] = { link = 'rainbow3' },
    ['@markup.heading.4.markdown'] = { link = 'rainbow4' },
    ['@markup.heading.5.markdown'] = { link = 'rainbow5' },
    ['@markup.heading.6.markdown'] = { link = 'rainbow6' },

    -- Java
    ['@constant.java'] = { fg = c.teal },

    -- CSS
    ['@property.css'] = { fg = c.blue },
    ['@property.scss'] = { fg = c.blue },
    ['@property.id.css'] = { fg = c.yellow },
    ['@property.class.css'] = { fg = c.yellow },
    ['@type.css'] = { fg = c.lavender },
    ['@type.tag.css'] = { fg = c.blue },
    ['@string.plain.css'] = { fg = c.text },
    ['@number.css'] = { fg = c.peach },
    ['@keyword.directive.css'] = { link = 'Keyword' }, -- CSS at-rules: https://developer.mozilla.org/en-US/docs/Web/CSS/At-rule.

    -- HTML
    ['@string.special.url.html'] = { fg = c.green }, -- Links in href, src attributes.
    ['@markup.link.label.html'] = { fg = c.text }, -- Text between <a></a> tags.
    ['@character.special.html'] = { fg = c.red }, -- Symbols such as &nbsp;.

    -- Lua
    ['@constructor.lua'] = { link = '@punctuation.bracket' }, -- For constructor calls and definitions: = { } in Lua.

    -- Python
    ['@constructor.python'] = { fg = c.sky }, -- __init__(), __new__().

    -- YAML
    ['@label.yaml'] = { fg = c.yellow }, -- Anchor and alias names.

    -- Ruby
    ['@string.special.symbol.ruby'] = { fg = c.flamingo },

    -- PHP
    ['@function.method.php'] = { link = 'Function' },
    ['@function.method.call.php'] = { link = 'Function' },

    -- C/CPP
    ['@keyword.import.c'] = { fg = c.yellow },
    ['@keyword.import.cpp'] = { fg = c.yellow },

    -- C#
    ['@attribute.c_sharp'] = { fg = c.yellow },

    -- gitcommit
    ['@comment.warning.gitcommit'] = { fg = c.yellow },

    -- gitignore
    ['@string.special.path.gitignore'] = { fg = c.text },

    -- Misc
    gitcommitSummary = { fg = c.rosewater, style = { 'italic' } },
    zshKSHFunction = { link = 'Function' },
  })
end
