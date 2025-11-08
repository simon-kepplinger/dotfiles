local logo = [[
  _   _       _           
 | \ | |     (_)          
 |  \| |_   ___ _ __ ___  
 | . ` \ \ / / | '_ ` _ \ 
 | |\  |\ V /| | | | | | |
 |_| \_| \_/ |_|_| |_| |_|
                          
]]

return {
  'nvimdev/dashboard-nvim',
  event = 'VimEnter',
  config = function()
    require('dashboard').setup({
      config = {
        theme = 'hyper',
        disable_move = true,
        header = vim.split(logo, '\n', { trimempty = true }),
        footer = {},
        shortcut = {
          { icon = ' ', desc = 'Files [<leader>y]', group = 'Label' },
          {
            icon = '󰈔 ',
            desc = 'New file',
            key = 'n',
            action = 'enew',
            group = 'Label',
          },
          { icon = ' ', desc = 'Find [<leader>ff]', group = 'Label' },
          { icon = ' ', desc = 'Grep [<leader>fg]', group = 'Label' },
        },
      },
    })
  end,
  init = function()
    -- show dahsboard if opened on path
    if vim.fn.argc(-1) == 1 then
      local a = vim.fn.argv(0)
      local st = vim.loop.fs_stat(a)
      if st and st.type == 'directory' then
        vim.fn.chdir(a)
        vim.schedule(function()
          vim.cmd('Dashboard')
        end)
      end
    end
  end,
  dependencies = { { 'nvim-tree/nvim-web-devicons' } },
}
