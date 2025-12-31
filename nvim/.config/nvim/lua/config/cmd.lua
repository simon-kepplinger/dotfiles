-- auto-clear search highlighting when moving the cursor and no match exists
vim.api.nvim_create_autocmd('CursorMoved', {
  group = vim.api.nvim_create_augroup('auto-hlsearch', { clear = true }),
  callback = function()
    if vim.v.hlsearch == 1 and vim.fn.searchcount().exact_match == 0 then
      vim.schedule(function()
        vim.cmd.nohlsearch()
      end)
    end
  end,
})

local M = {}

-- smart close
local function is_floating(win)
  return vim.api.nvim_win_get_config(win).relative ~= ''
end

local function is_aux_window(win)
  local buf = vim.api.nvim_win_get_buf(win)
  local bt = vim.bo[buf].buftype
  return bt ~= '' -- help, quickfix, terminal, prompt, nofile, etc.
end

local function count_normal_wins_in_tab()
  local wins = vim.api.nvim_tabpage_list_wins(0)
  local n = 0
  for _, w in ipairs(wins) do
    if not is_floating(w) then
      n = n + 1
    end
  end
  return n
end

function M.smart_close()
  local cur = vim.api.nvim_get_current_win()

  -- Close "aux" windows directly
  if is_aux_window(cur) then
    pcall(vim.cmd, 'wincmd q')
    return
  end

  -- Normal editing window: close split if there are multiple; otherwise "only"
  if count_normal_wins_in_tab() > 1 then
    pcall(vim.cmd, 'wincmd q')
  else
    pcall(vim.cmd, 'wincmd o')
  end
end

return M
