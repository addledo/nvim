return {
  'tpope/vim-fugitive',
  cmd = {
    'G',
    'Git',
    'Gdiffsplit',
    'Gvdiffsplit',
    'Gedit',
    'Gsplit',
    'Gread',
    'Gwrite',
    'Ggrep',
    'Glgrep',
    'Gmove',
    'Gdelete',
    'Gremove',
    'Gbrowse',
  },
  keys = {
    { '<leader>gB', '<cmd>G blame<cr>', desc = 'Git blame' },
  },
}
