return {
  {
    'vim-test/vim-test',

    cmd = {
      'TestNearest',
      'TestFile',
      'TestSuite',
      'TestLast',
      'TestVisit',
      'TestClass',
    },

    keys = {
      { '<leader>tn', '<cmd>TestNearest<cr>', desc = 'Test nearest' },
      { '<leader>tN', '<cmd>TestClass<cr>', desc = 'Test class (pytest)' },
      { '<leader>tf', '<cmd>TestFile<cr>', desc = 'Test file' },
      { '<leader>ts', '<cmd>TestSuite<cr>', desc = 'Test suite' },
      { '<leader>tl', '<cmd>TestLast<cr>', desc = 'Test last' },
      { '<leader>tv', '<cmd>TestVisit<cr>', desc = 'Visit last test file' },
    },
  },
}
