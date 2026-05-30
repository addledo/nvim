return {
  'akinsho/toggleterm.nvim',
  event = 'VeryLazy',
  enabled = true,
  version = '*',
  opts = {
    shell = global_shell,
    -- direction = 'float',
    float_opts = { border = 'curved' },
    -- size = 15,
  },
  keys = {
    {
      '<leader>tt',
      '<cmd>ToggleTerm direction=float<CR>',
      desc = 'Float terminal',
    },
    {
      '<leader>tb',
      '<cmd>ToggleTerm direction=horizontal<CR>',
      desc = 'Bottom terminal',
    },
    {
      '<leader>tv',
      '<cmd>ToggleTerm direction=vertical size=100<CR>',
      desc = 'Vertical terminal',
    },
  },
}
