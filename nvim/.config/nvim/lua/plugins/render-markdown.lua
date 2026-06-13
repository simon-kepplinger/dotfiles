local palette = require('config.theme.palette')

return {
  'MeanderingProgrammer/render-markdown.nvim',
  ft = { 'markdown' },

  opts = {
    enabled = false,
    file_types = { 'markdown' },
  },

  keys = {
    {
      '<leader>mr',
      '<cmd>RenderMarkdown buf_toggle<CR>',
      ft = { 'markdown' },
      desc = 'Markdown: toggle rendered view (buffer)',
    },
  },

  config = function(_, opts)
    require('render-markdown').setup(opts)

    vim.api.nvim_set_hl(0, 'RenderMarkdownCode', { bg = palette.crust })
    vim.api.nvim_set_hl(0, 'RenderMarkdownCodeInline', { bg = palette.crust })
  end,
}
