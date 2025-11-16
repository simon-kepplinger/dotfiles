local function with_suffix(key, tbl)
  if not key or key == '' then
    return tbl
  end

  local suffixed = {}

  for name, value in pairs(tbl) do
    suffixed[name .. key] = value
  end

  return suffixed
end

return with_suffix
