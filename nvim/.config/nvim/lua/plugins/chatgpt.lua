return {
  'jackMort/ChatGPT.nvim',
  event = 'VeryLazy',
  config = function()
    require('chatgpt').setup({
      openai_params = {
        model = 'gpt-5-mini',
        max_completion_tokens = 2000,
        temperature = 1,
      },
      openai_edit_params = {
        model = 'gpt-5-mini',
        max_completion_tokens = 2000,
        temperature = 1,
      },
      popup_input = {
        submit = '<CR>',
      },
    })

    require('chatgpt.config').options.openai_params.max_tokens = nil
    require('chatgpt.config').options.openai_edit_params.max_tokens = nil
  end,
  dependencies = {
    'MunifTanjim/nui.nvim',
    'nvim-lua/plenary.nvim',
    'folke/trouble.nvim', -- optional
  },
}
