return {
  'lewis6991/gitsigns.nvim',
  main = 'gitsigns', -- makes lazy's auto-setup module explicit
  event = { 'BufReadPre', 'BufNewFile' },

  opts = {
    signs_staged_enable = true,

    -- Gitsigns recommends putting buffer-local mappings in on_attach
    on_attach = function(bufnr)
      local gs = require('gitsigns')

      local function map(mode, lhs, rhs, desc)
        vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, desc = desc })
      end

      -- Navigation (keeps default behavior in :diff windows)
      map('n', ']c', function()
        if vim.wo.diff then
          vim.cmd.normal({ ']c', bang = true })
        else
          gs.nav_hunk('next')
        end
      end, 'Next Git hunk')

      map('n', '[c', function()
        if vim.wo.diff then
          vim.cmd.normal({ '[c', bang = true })
        else
          gs.nav_hunk('prev')
        end
      end, 'Previous Git hunk')

      -- Hunks
      map('n', '<leader>ghs', gs.stage_hunk, 'Stage hunk')
      map('n', '<leader>ghr', gs.reset_hunk, 'Reset hunk (discard changes)')

      map('v', '<leader>ghs', function()
        gs.stage_hunk({ vim.fn.line('.'), vim.fn.line('v') })
      end, 'Stage selected lines (hunk)')

      map('v', '<leader>ghr', function()
        gs.reset_hunk({ vim.fn.line('.'), vim.fn.line('v') })
      end, 'Reset selected lines (discard changes)')

      map('n', '<leader>ghS', gs.stage_buffer, 'Stage buffer')
      map('n', '<leader>ghR', gs.reset_buffer, 'Reset buffer (discard changes)')

      map('n', '<leader>ghp', gs.preview_hunk, 'Preview hunk')
      map('n', '<leader>ghP', gs.preview_hunk_inline, 'Preview hunk inline')

      -- Blame / Diff
      map('n', '<leader>ghb', function()
        gs.blame_line({ full = true })
      end, 'Blame line (full)')

      map('n', '<leader>ghB', '<cmd>Gitsigns blame<cr>', 'Blame buffer')

      map('n', '<leader>ghd', gs.diffthis, 'Diff this')
      map('n', '<leader>ghD', function()
        gs.diffthis('~')
      end, 'Diff this (~)')

      -- Lists
      map('n', '<leader>ghq', gs.setqflist, 'Quickfix hunks')
      map('n', '<leader>ghQ', function()
        gs.setqflist('all')
      end, 'Quickfix hunks (all)')

      -- Toggles
      map('n', '<leader>gts', gs.toggle_signs, 'Toggle git signs')
      map(
        'n',
        '<leader>gtb',
        gs.toggle_current_line_blame,
        'Toggle current line blame'
      )
      map('n', '<leader>gtw', gs.toggle_word_diff, 'Toggle word diff')

      -- Text object
      map({ 'o', 'x' }, 'ih', gs.select_hunk, 'Select git hunk')

      -- which key groups
      local ok, wk = pcall(require, 'which-key')
      if ok then
        wk.add({
          { '<leader>gh', group = 'Git Hunks' },
          { '<leader>gt', group = 'Git Toggles' },
        }, { buffer = bufnr })
      end
    end,
  },
}
