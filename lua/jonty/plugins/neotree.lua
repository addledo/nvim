return {
  'nvim-neo-tree/neo-tree.nvim',
  branch = 'v3.x',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'MunifTanjim/nui.nvim',
    'nvim-tree/nvim-web-devicons', -- optional, but recommended
  },
  lazy = false, -- neo-tree will lazily load itself
  cmd = 'Neotree',
  config = function()
    vim.keymap.set('n', '<leader>b', '<cmd>Neotree source=buffers position=right<CR>')
  end
}
