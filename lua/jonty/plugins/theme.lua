return {

  -- Sonokai
  {
    'sainnhe/sonokai',
    lazy = false,
    priority = 1000,
    config = function()
      vim.cmd.colorscheme 'sonokai'
    end,
  },

  -- Github
  {
    'projekt0n/github-nvim-theme',
    enabled = false,
    name = 'github-theme',
    lazy = false, -- make sure we load this during startup if it is your main colorscheme
    priority = 1000, -- make sure to load this before all the other start plugins
    config = function()
      require('github-theme').setup {}
      -- vim.cmd 'colorscheme github_dark_colorblind'
    end,
  },

  -- Monokai
  {
    'loctvl842/monokai-pro.nvim',
    enabled = false,
    lazy = false,
    priority = 1000,
    config = function()
      require('monokai-pro').setup()
      -- vim.cmd.colorscheme 'monokai-pro'
    end,
  },

  -- Nightfox
  {
    'EdenEast/nightfox.nvim',
    enabled = false,
    config = function()
      require('nightfox').setup {
        options = {
          colorblind = {
            enable = true,
            severity = {
              deutan = 1,
            },
          },
        },
        -- vim.cmd.colorscheme 'terafox',
      }
    end,
  },
}
