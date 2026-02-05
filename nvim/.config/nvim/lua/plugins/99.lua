return {
  'ThePrimeagen/99',
  config = function()
    local _99 = require('99')

    _99.setup({
      model = 'anthropic/claude-sonnet-4-5',

      logger = {
        print_on_error = true,
      },
    })

    vim.keymap.set('n', '<leader>9f', function()
      _99.fill_in_function_prompt()
    end)

    vim.keymap.set('v', '<leader>9v', function()
      _99.visual_prompt({})
    end)

    -- Stop requests
    vim.keymap.set('n', '<leader>9s', function()
      _99.stop_all_requests()
    end)
  end,
}
