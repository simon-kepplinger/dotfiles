local GLOBAL_CFG = vim.fn.expand('~/.config/biome/biome.jsonc')
local uv = vim.uv or vim.loop

return {
  stdin = true,

  -- use global config file if no config is found in root dir
  args = function(_, ctx)
    local args = { 'format', '--stdin-file-path', ctx.filename }

    local start = vim.fs.dirname(ctx.filename)
    local local_cfg = vim.fs.find(
      { 'biome.json', 'biome.jsonc' },
      { path = start, upward = true }
    )[1]

    local has_global = GLOBAL_CFG and uv.fs_stat(GLOBAL_CFG) ~= nil

    if not local_cfg and has_global then
      table.insert(args, '--config-path')
      table.insert(args, GLOBAL_CFG)
    end

    return args
  end,
}
