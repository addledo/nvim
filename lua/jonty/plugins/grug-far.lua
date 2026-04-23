return {
  'MagicDuck/grug-far.nvim',
  event = 'VeryLazy',
  opts = {},
  dependencies = { "folke/which-key.nvim" },

  keys = function()
    require('which-key').add {
      { '<leader>gf',  group = 'GrugFar' },
      { '<leader>gfa', group = 'ast-grep' },
    }

    local gf = require('grug-far')

    return {
      -- With ripgrep
      {
        '<leader>gf<space>',
        function() gf.open { prefills = { flags = '-S', } } end,
        desc = 'GrugFar',
      },
      {
        '<leader>gf%',
        function()
          gf.open {
            prefills = {
              paths = vim.fn.expand('%'),
            },
            flags = '-S',
          }
        end,
        desc = 'GrugFar file'
      },
      {
        '<leader>gf.',
        function()
          gf.open {
            prefills = {
              paths = vim.fn.expand('%:p:h'),
              flags = '-S',
            },
          }
        end,
        desc = 'GrugFar here'
      },

      -- With ast-grep
      {
        '<leader>gfa<space>',
        function() gf.open { engine = 'astgrep' } end,
        desc = 'GrugFar astgrep'
      },
      {
        '<leader>gfa%',
        function()
          gf.open {
            engine = 'astgrep',
            prefills = {
              paths = vim.fn.expand('%'),
            },
          }
        end,
        desc = 'GrugFar astgrep file'
      },
      {
        '<leader>gfa.',
        function()
          gf.open {
            engine = 'astgrep',
            prefills = {
              paths = vim.fn.expand('%:p:h'),
            },
          }
        end,
        desc = 'GrugFar astgrep here'
      },
    }
  end,
}
