return {
  {
    'nvim-neo-tree/neo-tree.nvim',
    branch = 'v3.x',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'MunifTanjim/nui.nvim',
      'nvim-tree/nvim-web-devicons',
    },
    lazy = false,

    opts = {
      popup_border_style = 'rounded',

      default_component_configs = {
        indent = {
          with_expanders = true,
          expander_collapsed = '',
          expander_expanded = '',
        },
        git_status = {
          symbols = {
            added = '✚',
            modified = '',
            deleted = '✖',
            renamed = '󰁕',
            untracked = '?',
            ignored = '',
            unstaged = '󰄱',
            staged = '󰱒',
            conflict = '',
          },
        },
      },

      filesystem = {
        hijack_netrw_behavior = 'disabled',
        filtered_items = {
          visible = true,
          hide_dotfiles = false,
          hide_gitignored = false,
          hide_ignored = false,
          hide_hidden = false,
        },
      },

      window = {
        mappings = {
          ['-'] = 'close_node',
          ['<esc>'] = 'close_window',
          ['v'] = 'open_rightbelow_vs',
          ['s'] = 'open_split',
          ['h'] = 'close_node',
          ['l'] = function(state)
            local node = state.tree:get_node()
            if not node then
              return
            end

            if
              node.type == 'directory'
              and not (node:is_expanded() or node.empty_expanded)
            then
              state.commands.toggle_node(state)
              return
            end

            vim.cmd('normal! j')
          end,
        },
      },

      event_handlers = {
        -- enable relative line numbers
        {
          event = 'neo_tree_buffer_enter',
          handler = function()
            vim.opt_local.number = true
            vim.opt_local.relativenumber = true
          end,
        },
      },
    },

    keys = {
      {
        '<leader>e',
        function()
          require('neo-tree.command').execute({
            action = 'focus',
            source = 'filesystem',
            position = 'float',
            toggle = true,
            reveal = true,
          })
        end,
        desc = 'Reveal file (neo-tree)',
      },
      {
        '<leader>bb',
        function()
          require('neo-tree.command').execute({
            action = 'focus',
            source = 'buffers',
            position = 'float',
            toggle = true,
            reveal = true,
          })
        end,
        desc = 'Buffers (neo-tree)',
      },
      {
        '<leader>gs',
        function()
          require('neo-tree.command').execute({
            action = 'focus',
            source = 'git_status',
            position = 'float',
            toggle = true,
            reveal = true,
          })
        end,
        desc = 'Buffers (neo-tree)',
      },
    },
  },
}
