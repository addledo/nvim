return {
  'echasnovski/mini.nvim',

  config = function()
    require('mini.ai').setup { n_lines = 500 }
    require('mini.indentscope').setup { symbol = '' }
    -- require('mini.surround').setup()
    require('mini.align').setup()
    require('mini.splitjoin').setup()
    require('mini.move').setup()
    -- require('mini.cursorword').setup()
  end, -- config
}
