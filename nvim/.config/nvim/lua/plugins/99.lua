return {
  'ThePrimeagen/99',
  config = function()
    local _99 = require('99')

    _99.setup({
      -- delegate to the Claude Code CLI (default model: claude-sonnet-4-5)
      provider = _99.Providers.ClaudeCodeProvider,

      -- auto-load project context files next to the request location
      md_files = { 'AGENT.md' },

      logger = {
        print_on_error = true,
      },
    })

    -- search the project; results land in the quickfix list (the way 99 is heading)
    vim.keymap.set('n', '<leader>9s', _99.search, { desc = '99: search' })

    -- free-form prompt that can edit code; opens an editable buffer, submit with :w
    vim.keymap.set('n', '<leader>9p', function()
      _99.vibe({})
    end, { desc = '99: prompt (vibe)' })

    -- picker of previous successful requests (read-only history)
    vim.keymap.set('n', '<leader>9o', _99.open, { desc = '99: open history' })

    -- act on the current visual selection; opens an editable buffer, submit with :w
    vim.keymap.set('v', '<leader>9v', function()
      _99.visual({})
    end, { desc = '99: visual prompt' })

    -- stop all in-flight requests
    vim.keymap.set('n', '<leader>9x', _99.stop_all_requests, { desc = '99: stop' })
  end,
}
