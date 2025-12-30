local palette = require('config.theme.palette')

return {
  'b0o/incline.nvim',
  opts = {
    window = {
      placement = { vertical = 'top', horizontal = 'right' },
      overlap = {
        borders = true,
        winbar = false,
        tabline = false,
        statusline = false,
      },
      margin = {
        vertical = { top = 0, bottom = 0 },
        horizontal = { left = 1, right = 1 },
      },
      padding = 1,
    },

    -- make it show on dashboards/start screens too
    ignore = {
      unlisted_buffers = false, -- default is true
      buftypes = {}, -- default is "special"
      wintypes = {}, -- default is "special"
    },

    highlight = {
      groups = {
        InclineNormal = { guifg = palette.base, guibg = '#71b7ff' },
        InclineNormalNC = { guifg = palette.text, guibg = palette.surface0 },
      },
    },
  },
}
