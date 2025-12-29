return {
  'jake-stewart/multicursor.nvim',
  branch = '1.0',
  config = function()
    local mc = require('multicursor-nvim')
    mc.setup()

    local set = vim.keymap.set

    -- Add or skip cursor above/below the main cursor.
    set({ 'n', 'x' }, '<up>', function()
      mc.lineSkipCursor(-1)
    end, { desc = 'Multicursor: skip cursor above' })
    set({ 'n', 'x' }, '<down>', function()
      mc.lineSkipCursor(1)
    end, { desc = 'Multicursor: skip cursor below' })
    set({ 'n', 'x' }, '<c-up>', function()
      mc.lineAddCursor(-1)
    end, { desc = 'Multicursor: add cursor above' })
    set({ 'n', 'x' }, '<c-down>', function()
      mc.lineAddCursor(1)
    end, { desc = 'Multicursor: add cursor below' })

    -- Add or skip adding a new cursor by matching word/selection
    set({ 'n', 'x' }, '<leader>n', function()
      mc.matchAddCursor(1)
    end, { desc = 'Multicursor: add next match cursor' })
    set({ 'n', 'x' }, '<leader>s', function()
      mc.matchSkipCursor(1)
    end, { desc = 'Multicursor: skip next match cursor' })
    set({ 'n', 'x' }, '<leader>N', function()
      mc.matchAddCursor(-1)
    end, { desc = 'Multicursor: add previous match cursor' })
    set({ 'n', 'x' }, '<leader>S', function()
      mc.matchSkipCursor(-1)
    end, { desc = 'Multicursor: skip previous match cursor' })

    -- Add and remove cursors with control + left click.
    set(
      'n',
      '<c-leftmouse>',
      mc.handleMouse,
      { desc = 'Multicursor: ctrl+click add/remove cursor' }
    )
    set(
      'n',
      '<c-leftdrag>',
      mc.handleMouseDrag,
      { desc = 'Multicursor: ctrl+drag cursor selection' }
    )
    set(
      'n',
      '<c-leftrelease>',
      mc.handleMouseRelease,
      { desc = 'Multicursor: ctrl+release finish mouse action' }
    )

    -- Disable and enable cursors.
    set(
      { 'n', 'x' },
      '<c-q>',
      mc.toggleCursor,
      { desc = 'Multicursor: toggle cursor enabled/disabled' }
    )

    -- Mappings defined in a keymap layer only apply when there are
    -- multiple cursors. This lets you have overlapping mappings.
    mc.addKeymapLayer(function(layerSet)
      -- Select a different cursor as the main one.
      layerSet(
        { 'n', 'x' },
        '<left>',
        mc.prevCursor,
        { desc = 'Multicursor: select previous cursor' }
      )
      layerSet(
        { 'n', 'x' },
        '<right>',
        mc.nextCursor,
        { desc = 'Multicursor: select next cursor' }
      )

      -- Delete the main cursor.
      layerSet(
        { 'n', 'x' },
        '<leader>x',
        mc.deleteCursor,
        { desc = 'Multicursor: delete main cursor' }
      )

      -- Enable and clear cursors using escape.
      layerSet('n', '<esc>', function()
        if not mc.cursorsEnabled() then
          mc.enableCursors()
        else
          mc.clearCursors()
        end
      end, { desc = 'Multicursor: enable cursors / clear cursors' })
    end)

    -- Customize how cursors look.
    local hl = vim.api.nvim_set_hl
    hl(0, 'MultiCursorCursor', { reverse = true })
    hl(0, 'MultiCursorVisual', { link = 'Visual' })
    hl(0, 'MultiCursorSign', { link = 'SignColumn' })
    hl(0, 'MultiCursorMatchPreview', { link = 'Search' })
    hl(0, 'MultiCursorDisabledCursor', { reverse = true })
    hl(0, 'MultiCursorDisabledVisual', { link = 'Visual' })
    hl(0, 'MultiCursorDisabledSign', { link = 'SignColumn' })
  end,
}
