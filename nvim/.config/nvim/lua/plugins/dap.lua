local palette = require('config.theme.palette')

return {
  'mfussenegger/nvim-dap',
  event = 'VeryLazy',

  dependencies = {
    'rcarriga/nvim-dap-ui',
    'theHamsta/nvim-dap-virtual-text',
    'nvim-neotest/nvim-nio',
  },

  config = function()
    local dap = require('dap')
    local dap_ui = require('dapui')
    local dap_virtual_text = require('nvim-dap-virtual-text')
    local widgets = require('dap.ui.widgets')

    dap_ui.setup()
    dap_virtual_text.setup({})

    -- auto-open / close the sidebar when sessions start & stop
    dap.listeners.before.attach.dapui = function()
      dap_ui.open()
    end
    dap.listeners.before.launch.dapui = function()
      dap_ui.open()
    end
    dap.listeners.before.event_terminated.dapui = function()
      dap_ui.close()
    end
    dap.listeners.before.event_exited.dapui = function()
      dap_ui.close()
    end

    -- configure elixir
    local elixir_config = require('config.dap-configs.elixir')
    dap.adapters[elixir_config.name] = elixir_config.adapter
    dap.configurations.elixir = elixir_config.configurations

    -- workaround for ElixirLS debugger not supporting exception breakpoints
    dap.listeners.after.initialize['elixirls_no_exception_bps'] = function(
      session
    )
      -- Your sessions are type = "mix_task" for ElixirLS configs
      if
        session.config.type == 'mix_task'
        and session.capabilities
        and session.capabilities.exceptionBreakpointFilters
        and vim.tbl_isempty(session.capabilities.exceptionBreakpointFilters)
      then
        session.capabilities.exceptionBreakpointFilters = nil
      end
    end

    -- customize visuals
    vim.api.nvim_set_hl(0, 'DapBreakpoint', { fg = palette.red })
    vim.api.nvim_set_hl(0, 'DapStoppedLine', { bg = palette.surface0 })
    vim.api.nvim_set_hl(0, 'DapStopped', { fg = palette.peach })

    vim.fn.sign_define('DapBreakpoint', {
      text = '●',
      texthl = 'DapBreakpoint',
      linehl = '',
      numhl = '',
    })

    vim.fn.sign_define('DapStopped', {
      text = '▶',
      texthl = 'DapStopped',
      linehl = 'DapStoppedLine',
      numhl = 'DapStoppedLine',
    })

    -- keymaps
    local map = vim.keymap.set
    map(
      'n',
      '<Leader>db',
      dap.toggle_breakpoint,
      { desc = 'DAP toggle breakpoint' }
    )
    map('n', '<F6>', dap.continue, { desc = 'DAP continue / start' })
    map('n', '<F7>', dap.step_into, { desc = 'DAP step into' })
    map('n', '<F8>', dap.step_over, { desc = 'DAP next step / step over' })
    map('n', '<F9>', dap.step_out, { desc = 'DAP step out' })
    map('n', '<Leader>dr', dap.repl.open, { desc = 'DAP open REPL' })

    map(
      'n',
      '<leader>dC',
      dap.clear_breakpoints,
      { desc = 'DAP clear breakpoints' }
    )

    map('n', '<leader>du', dap_ui.toggle, { desc = 'DAP UI toggle' })
    map({ 'n', 'v' }, '<leader>de', widgets.hover, { desc = 'DAP eval/hover' })
  end,
}
