local palette = require('config.theme.palette')

return {
  'nvim-treesitter/nvim-treesitter-context',
  opts = {
    max_lines = 4,
    min_window_height = 15,
    line_numbers = true,
    multiline_threshold = 3,
    trim_scope = 'inner',
    mode = 'cursor',
    separator = '─',
    zindex = 20,
    on_attach = function()
      vim.api.nvim_set_hl(
        0,
        'TreesitterContextLineNumber',
        { fg = palette.surface2 }
      )
      vim.api.nvim_set_hl(
        0,
        'TreesitterContextSeparator',
        { fg = palette.surface2 }
      )
    end,
  },
}
