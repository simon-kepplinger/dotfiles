local palette = require('config.theme.palette')

return {
  'MeanderingProgrammer/render-markdown.nvim',
  ft = { 'markdown', 'codecompanion' },

  opts = {
    enabled = false,
    file_types = { 'markdown', 'codecompanion' },
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

    -- Enable rendering automatically ONLY for CodeCompanion buffers (buffer-local)
    local function enable_cc()
      require('render-markdown').buf_enable()
    end

    vim.api.nvim_create_autocmd('FileType', {
      pattern = 'codecompanion',
      callback = enable_cc,
    })

    -- If we were loaded *inside* an already-open CodeCompanion buffer, enable immediately
    if vim.bo.filetype == 'codecompanion' then
      enable_cc()
    end

    vim.api.nvim_set_hl(0, 'RenderMarkdownCode', { bg = palette.crust })
    vim.api.nvim_set_hl(0, 'RenderMarkdownCodeInline', { bg = palette.crust })
  end,
}
