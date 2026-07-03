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
      '<cmd>ToggleTerm direction=vertical size=130<CR>',
      desc = 'Vertical terminal',
    },
    {
      '<leader>th',
      function()
        require('toggleterm.terminal').Terminal
          :new({ direction = 'vertical', size = 100, dir = vim.fn.expand('%:p:h') })
          :toggle()
      end,
      desc = 'Terminal here',
    },
    {
      '<leader>td',
      function()
        local term = require('toggleterm.terminal').get_focused_terminal()
        if term then term:shutdown() end
      end,
      mode = 't',
      desc = 'Terminal destroy',
    },
  },
}
