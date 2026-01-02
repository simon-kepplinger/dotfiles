local name = 'mix_task'

return {
  name = name,

  adapter = {
    type = 'executable',
    command = vim.fn.exepath('elixir-ls-debugger')
      or (vim.fn.stdpath('data') .. '/mason/bin/elixir-ls-debugger'),
    args = {},
  },

  configurations = {
    {
      type = name,
      name = 'mix test (all)',
      request = 'launch',
      task = 'test',
      taskArgs = { '--trace' },
      projectDir = '${workspaceFolder}',
      startApps = false,
      requireFiles = {
        'test/**/test_helper.exs',
        'test/**/*_test.exs',
      },
    },
  },
}
