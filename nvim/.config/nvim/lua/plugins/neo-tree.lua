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
      sources = { 'filesystem', 'buffers', 'git_status', 'document_symbols' },

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
          ['<esc>'] = 'close_window',
          ['v'] = 'open_rightbelow_vs',
          ['s'] = 'open_split',
          ['h'] = 'close_node',
          -- expand dir, move into or move over
          ['l'] = function(state)
            local node = state.tree:get_node()
            if not node then
              return
            end

            -- Filesystem dirs can be "lazy": children may not exist until first expand/open.
            local expandable = (node.type == 'directory') or node:has_children()

            if
              expandable and not (node:is_expanded() or node.empty_expanded)
            then
              state.commands.toggle_node(state)
              return
            end

            vim.cmd('normal! j')
          end,
        },
        -- navigate one dir up without closing
        ['-'] = function(state)
          local node = state.tree:get_node()
          local parent_id = node and node:get_parent_id()
          if parent_id then
            require('neo-tree.ui.renderer').focus_node(state, parent_id)
          end
        end,

        fuzzy_finder_mappings = {
          ['<CR>'] = 'close_keep_filter',
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
        -- clear filter between "sessions"
        {
          event = 'neo_tree_window_before_close',
          handler = function(args)
            -- only when the filesystem float closes ("session" ends)
            if args.source ~= 'filesystem' or args.position ~= 'float' then
              return
            end

            vim.schedule(function()
              local state =
                require('neo-tree.sources.manager').get_state('filesystem')
              if state and state.search_pattern then
                -- IMPORTANT: refresh=false so it can't reopen the window
                require('neo-tree.sources.filesystem').reset_search(
                  state,
                  false
                )
              end
            end)
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
        '<leader>ss',
        function()
          require('neo-tree.command').execute({
            action = 'focus',
            source = 'document_symbols',
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
