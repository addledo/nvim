return {
  'EdenEast/nightfox.nvim',

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

