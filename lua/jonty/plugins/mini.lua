return {
    'echasnovski/mini.nvim',

    config = function()
      require('mini.ai').setup { n_lines = 500 }
      require('mini.surround').setup()
      require('mini.align').setup()

      local statusline = require 'mini.statusline'
      statusline.setup { use_icons = vim.g.have_nerd_font }
      -- Set the section for cursor location to LINE:COLUMN
      statusline.section_location = function()
        return '%2l:%-2v'
      end

    end, -- config
}
