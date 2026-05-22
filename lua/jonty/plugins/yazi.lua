return {
  'mikavilpas/yazi.nvim',
  version = '*', -- use the latest stable version
  event = 'VeryLazy',
  dependencies = {
    { 'nvim-lua/plenary.nvim', lazy = true },
  },
  keys = {
    {
      '<leader>y<space>',
      mode = { 'n', 'v' },
      '<cmd>Yazi cwd<cr>',
      desc = '[Y]azi',
    },
    {
      -- Open in the current file's directory
      '<leader>yh',
      '<cmd>Yazi<cr>',
      desc = '[Y]azi [h]ere',
    },
    {
      "<leader>yr",
      function()
        local root = vim.fs.root(0, { ".git" }) or vim.uv.cwd()
        require("yazi").yazi({}, root)
      end,
      desc = "[Y]azi [r]epo",
    },
    {
      '<leader>Y',
      '<cmd>Yazi toggle<cr>',
      desc = 'Resume the last yazi session',
    },
  },
  ---@type YaziConfig | {}
  opts = {
    change_neovim_cwd_on_close = false,
    -- if you want to open yazi instead of netrw, see below for more info
    open_for_directories = false,
    keymaps = {
      show_help = '<f1>',
    },
  },
  init = function()
    -- mark netrw as loaded so it's not loaded at all.
    vim.g.loaded_netrwPlugin = 1
  end,
}
