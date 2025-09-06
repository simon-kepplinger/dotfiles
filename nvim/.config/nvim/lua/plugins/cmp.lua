-- See `:help cmp`
-- A completion plugin for neovim coded in Lua.

return {
  'hrsh7th/nvim-cmp',
  event = 'InsertEnter',

  dependencies = {
    {
      'L3MON4D3/LuaSnip',
      build = 'make install_jsregexp',
      dependencies = {
        {
          'rafamadriz/friendly-snippets',
          config = function()
            require('luasnip.loaders.from_vscode').lazy_load()
          end,
        },
      },
    },
    'saadparwaiz1/cmp_luasnip',
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/cmp-path',
    'hrsh7th/cmp-nvim-lsp-signature-help',
  },

  config = function()
    local cmp = require('cmp')
    local luasnip = require('luasnip')

    luasnip.config.setup({})

    cmp.setup({
      snippet = {
        expand = function(args)
          luasnip.lsp_expand(args.body)
        end,
      },

      completion = { completeopt = 'menu,menuone,noinsert' },

      window = {
        completion = { border = 'rounded' },
        documentation = { border = 'rounded' },
      },

      mapping = cmp.mapping.preset.insert({
        ['<C-n>'] = cmp.mapping.select_next_item(), -- next
        ['<C-p>'] = cmp.mapping.select_prev_item(), -- previous
        ['<C-b>'] = cmp.mapping.scroll_docs(-4), -- doc back
        ['<C-f>'] = cmp.mapping.scroll_docs(4), -- doc fwd
        ['<C-y>'] = cmp.mapping.confirm({ select = true }),
        ['<C-Space>'] = cmp.mapping.complete({}),

        -- LuaSnip jump/expand
        ['<C-l>'] = cmp.mapping(function()
          if luasnip.expand_or_locally_jumpable() then
            luasnip.expand_or_jump()
          end
        end, { 'i', 's' }),

        ['<C-h>'] = cmp.mapping(function()
          if luasnip.locally_jumpable(-1) then
            luasnip.jump(-1)
          end
        end, { 'i', 's' }),
      }),

      sources = {
        { name = 'lazydev', group_index = 0 }, -- Lua-LS tweaks
        { name = 'nvim_lsp' },
        { name = 'luasnip' },
        { name = 'path' },
        { name = 'nvim_lsp_signature_help' },
      },
    })
  end,
}
