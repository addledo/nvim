return {
  'MagicDuck/grug-far.nvim',
  event = 'VeryLazy',
  config = function()
    require('grug-far').setup {}
    vim.keymap.set('n', '<leader>gf', function()
      require('grug-far').open {
        prefills = {
          flags = '-i',
        },
      }
    end)
  end,
}
