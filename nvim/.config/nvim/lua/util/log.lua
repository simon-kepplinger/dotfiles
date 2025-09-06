-- log into ~/cache/nvim/lua-debug.log
local function log(...)
  local path = vim.fn.stdpath('cache') .. '/lua_debug.log'
  vim.fn.mkdir(vim.fn.fnamemodify(path, ':h'), 'p')
  local ok, f = pcall(io.open, path, 'a')

  if not ok or not f then
    return
  end

  local parts = {}
  for i = 1, select('#', ...) do
    local v = select(i, ...)
    parts[#parts + 1] = type(v) == 'table' and vim.inspect(v) or tostring(v)
  end

  f:write(
    ('%s %s\n'):format(os.date('%Y-%m-%d %H:%M:%S'), table.concat(parts, ' '))
  )
  f:close()
end

return log
