-- lua/custom/plugins/telescope-extra.lua
return {
  'nvim-telescope/telescope.nvim',
  keys = {
    {
      '<leader>sF',
      function()
        require('telescope.builtin').find_files { hidden = true, no_ignore = true }
      end,
      desc = '[S]earch [F]iles (including hidden)',
    },
  },
}
