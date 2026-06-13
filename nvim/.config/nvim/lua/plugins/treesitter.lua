return {
  'nvim-treesitter/nvim-treesitter',
  branch = 'main',
  lazy = false,
  build = ':TSUpdate',

  config = function()
    local ts = require('nvim-treesitter')

    -- install parsers (async, no-op if already installed)
    ts.install({
      'vim',
      'vimdoc',
      'query',
      'bash',
      'lua',
      'html',
      'markdown',
      'markdown_inline',
      'javascript',
      'typescript',
      'c',
      'rust',
    })

    -- highlighting + (experimental) indentation are enabled per buffer on main.
    -- vim.treesitter.start() disables legacy regex syntax by default
    -- (replaces the old `additional_vim_regex_highlighting = false`).
    vim.api.nvim_create_autocmd('FileType', {
      callback = function(ev)
        local lang = vim.treesitter.language.get_lang(vim.bo[ev.buf].filetype)

        -- auto-install a missing parser on first open (mirrors the old
        -- `auto_install = true`; runs async, ready from the next open).
        -- only attempt real parsers — plugin window filetypes like `incline`
        -- map to themselves via get_lang() and would otherwise warn.
        local cfg = require('nvim-treesitter.config')
        if
          lang
          and vim.tbl_contains(cfg.get_available(), lang)
          and not vim.tbl_contains(cfg.get_installed('parsers'), lang)
        then
          ts.install(lang)
        end

        -- start treesitter highlighting if a parser is available
        if pcall(vim.treesitter.start, ev.buf) then
          vim.bo[ev.buf].indentexpr =
            "v:lua.require'nvim-treesitter'.indentexpr()"
        end
      end,
    })
  end,
}
