return {
  'mikavilpas/yazi.nvim',
  version = '*', -- use the latest stable version
  event = 'VeryLazy',
  dependencies = {
    { 'nvim-lua/plenary.nvim', lazy = true },
  },
  keys = {
    {
      '<leader>-',
      '<cmd>Yazi<cr>',
      desc = 'Open yazi at the current file',
    },
    {
      -- Open in the current working directory
      '<leader>cw',
      '<cmd>Yazi cwd<cr>',
      desc = "Open the file manager in nvim's working directory",
    },
    {
      '<c-up>',
      '<cmd>Yazi toggle<cr>',
      desc = 'Resume the last yazi session',
    },
  },
  ---@type YaziConfig
  opts = {
    -- Ensure yazi uses the same zoxide database as the terminal by inheriting
    -- the ZOXIDE_DB environment variable. If not set, zoxide uses its default
    -- location (~/.local/share/zoxide/db.zo on Linux/macOS).
    yazi_floating_window_border = 'rounded',
    open_for_directories = false,
    keymaps = {
      show_help = '<f1>',
    },
  },
}
