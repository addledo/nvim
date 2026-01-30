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
    -- Yazi will automatically use the same zoxide database as your terminal
    -- because it inherits the ZOXIDE_DB environment variable from Neovim.
    --
    -- How it works:
    -- 1. If ZOXIDE_DB is set in your shell, Neovim inherits it when started
    -- 2. yazi.nvim spawns yazi as a subprocess, which inherits from Neovim
    -- 3. Yazi's zoxide plugin uses the `zoxide` command, which respects ZOXIDE_DB
    --
    -- No additional configuration is needed. The database is automatically shared.
    -- Default location: ~/.local/share/zoxide/db.zo (Linux/macOS)
    yazi_floating_window_border = 'rounded',
    open_for_directories = false,
    keymaps = {
      show_help = '<f1>',
    },
  },
}
