return {
  'folke/which-key.nvim',
  event = 'VeryLazy',
  opts = {
    delay = 0,
    icons = {
      -- set icon mappings to true if you have a Nerd Font
      mappings = vim.g.have_nerd_font,
      -- If you are using a Nerd Font: set icons.keys to an empty table which will use the
      -- default which-key.nvim defined Nerd Font icons, otherwise define a string table
    },
  },
  config = function()
    local wk = require 'which-key'
    wk.add {
      { '<leader>s', group = 'Search' },
      { '<leader>f', group = 'Find' },
      { '<leader>y', group = 'Yazi' },
      { '<leader>t', group = 'Toggle' },
      { '<leader>g', group = 'Git' },
      { '<leader>h', group = 'Git Hunk', mode = { 'n', 'v' } },
      { '<leader>d', group = 'Diff / Directory' },
    }
  end,
}
-- vim: ts=2 sts=2 sw=2 et
