return {
  'sindrets/diffview.nvim',

  opts = {
    vim.keymap.set('n', '<leader>dm', '<cmd>DiffviewOpen main...HEAD<CR>', { desc = 'Diff main...HEAD' })
  }
}
