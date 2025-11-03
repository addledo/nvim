-- Comment plugin, includes useful operations like toggling comments

return {
  'numToStr/Comment.nvim',
  lazy = false,
  opts = {
    toggler = {
      line = '<C-_>', -- Set keybind Ctrl / to toggle comments
    },
    opleader = {
      line = '<C-_>', -- enables visual mode toggling
    },
  },
}
