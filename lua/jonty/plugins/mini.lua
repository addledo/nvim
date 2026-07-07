return {
  'echasnovski/mini.nvim',

  config = function()
    require('mini.ai').setup { n_lines = 500 }

    vim.g.miniindentscope_disable = true
    require('mini.indentscope').setup {
      draw = { animation = require('mini.indentscope').gen_animation.linear { duration = 5 } },
    }
    vim.keymap.set('n', '<leader>ti', function()
      vim.g.miniindentscope_disable = not vim.g.miniindentscope_disable
    end, { desc = 'Toggle indent scope' })

    require('mini.surround').setup()
    require('mini.align').setup()
    require('mini.splitjoin').setup()
    require('mini.move').setup()
    require('mini.cursorword').setup()

    local statusline = require 'mini.statusline'
    statusline.setup { use_icons = vim.g.have_nerd_font }
    -- Set the section for cursor location to LINE:COLUMN
    statusline.section_location = function()
      return '%2l:%-2v'
    end
  end, -- config
}
