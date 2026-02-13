return {
  'EdenEast/nightfox.nvim',

  lazy = false,
  priority = 1000,

  config = function ()
    require('nightfox').setup {
      options = {
        colorblind = {
          enable = true,
          severity = {
            deutan = 1,
          },
        },
      },
    vim.cmd.colorscheme 'terafox',
    }
  end,
}

