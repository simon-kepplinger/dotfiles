return {
  'stevearc/conform.nvim',
  event = { 'BufWritePre' },
  cmd = { 'ConformInfo' },

  keys = {
    {
      '<leader>cf',
      function()
        require('conform').format({ async = true, lsp_format = 'fallback' })
      end,
      mode = '',
      desc = '[C]ode [F]ormat',
    },
  },

  opts = {
    notify_on_error = false,
    format_on_save = {
      timeout_ms = 1000,
      lsp_format = true,
    },

    formatters_by_ft = {
      lua = { 'stylua' },
      sh = { 'shfmt' },

      javascript = { 'biome' },
      typescript = { 'biome' },
      json = { 'biome' },
      jsonc = { 'biome' },

      markdown = { 'prettierd', 'prettier', stop_after_first = true },
      html = { 'prettierd', 'prettier', stop_after_first = true },
      htmlangular = { 'prettierd', 'prettier', stop_after_first = true },
      css = { 'prettierd', 'prettier', stop_after_first = true },

      terraform = { 'terraformls' },
    },

    -- load configs dynamically from `config.formatter-configs/*`
    formatters = (function()
      local prefix = 'config.formatter-configs'
      local files = vim.fn.globpath(
        vim.o.runtimepath,
        'lua/config/formatter-configs/*.lua',
        true,
        true
      )

      local t = {}
      for _, f in ipairs(files) do
        local name = vim.fn.fnamemodify(f, ':t:r')

        if name then
          local ok, cfg = pcall(require, prefix .. '.' .. name)
          if ok then
            t[name] = cfg
          end
        end
      end

      return t
    end)(),
  },
}
