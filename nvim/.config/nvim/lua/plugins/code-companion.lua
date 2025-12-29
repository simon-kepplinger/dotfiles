return {
  'olimorris/codecompanion.nvim',
  version = '^18.3.1',

  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-treesitter/nvim-treesitter',
    'franco-ruggeri/codecompanion-spinner.nvim',
  },

  opts = {
    interactions = {
      chat = {
        adapter = {
          name = 'openai_responses',
          model = 'gpt-5.1-chat-latest',
        },
      },
      inline = {
        adapter = {
          name = 'openai_responses',
          model = 'gpt-5.1',
        },
      },
      cmd = {
        adapter = {
          name = 'openai_responses',
          model = 'gpt-5.1',
        },
      },
      background = {
        adapter = {
          name = 'openai_responses',
          model = 'gpt-5.1',
        },
      },
    },
    extensions = {
      spinner = {},
    },
  },

  keys = {
    -- Primary entry points (the 4 core commands)
    {
      '<leader>aa',
      '<cmd>CodeCompanionActions<cr>',
      desc = 'AI: Action palette',
    },
    { '<leader>ac', '<cmd>CodeCompanionChat<cr>', desc = 'AI: Chat' },
    { '<leader>ai', '<cmd>CodeCompanion<cr>', desc = 'AI: Inline prompt' },
    {
      '<leader>ax',
      '<cmd>CodeCompanionCmd<cr>',
      desc = 'AI: Command-line helper',
    },

    -- Built-in prompt library aliases
    {
      '<leader>am',
      '<cmd>CodeCompanion /commit<cr>',
      desc = 'AI: Commit message',
    },
    {
      '<leader>ar',
      '<cmd>CodeCompanionActions refresh<cr>',
      desc = 'AI: Refresh prompt library',
    },

    -- Visual-mode “power moves” (operate on the selected range)
    {
      '<leader>ae',
      "<cmd>'<,'>CodeCompanion /explain<cr>",
      mode = 'v',
      desc = 'AI: Explain selection',
    },
    {
      '<leader>af',
      "<cmd>'<,'>CodeCompanion /fix<cr>",
      mode = 'v',
      desc = 'AI: Fix selection',
    },
    {
      '<leader>al',
      "<cmd>'<,'>CodeCompanion /lsp<cr>",
      mode = 'v',
      desc = 'AI: Explain diagnostics (selection)',
    },
    {
      '<leader>at',
      "<cmd>'<,'>CodeCompanion /tests<cr>",
      mode = 'v',
      desc = 'AI: Generate tests (selection)',
    },
  },

  -- Optional: makes which-key show "<leader>a" as a group name ("AI")
  init = function()
    local ok, wk = pcall(require, 'which-key')
    if not ok then
      return
    end

    wk.add({
      { '<leader>a', group = 'AI' },
    })
  end,
}
