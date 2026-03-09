return {
  'stevearc/oil.nvim',
  cmd = 'Oil',
  opts = {
    vim.keymap.set('n', '-', '<CMD>Oil<CR>', { desc = 'Open parent directory' }),
  },
}
