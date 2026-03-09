return {
  'sindrets/diffview.nvim',
  cmd = 'DiffviewOpen',

  dependencies = {
    'nvim-tree/nvim-web-devicons'
  },

  opts = {
    vim.keymap.set('n', '<leader>dm', '<cmd>DiffviewOpen main...HEAD<CR>', { desc = 'Diff main...HEAD' }),
    vim.keymap.set('n', '<leader>dc', '<cmd>DiffviewClose<CR>', { desc = 'DiffviewClose' }),
  }
}
