-- Set <space> as the leader key
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Set to true if you have a Nerd Font installed and selected in the terminal
vim.g.have_nerd_font = true

-- Ensure yazi uses the same zoxide database as the terminal
-- by setting the _ZO_DATA_DIR environment variable if not already set.
-- This ensures that zoxide tracks visited directories consistently
-- between terminal and yazi opened from nvim.
-- Reference: https://github.com/sxyazi/yazi/issues/865
if not vim.env._ZO_DATA_DIR then
  -- Use the default zoxide data directory based on the OS
  -- Zoxide stores its database in a 'zoxide' subdirectory
  local data_dir
  if vim.fn.has 'mac' == 1 then
    data_dir = vim.fn.expand '$HOME/Library/Application Support/zoxide'
  elseif vim.fn.has 'win32' == 1 then
    data_dir = vim.fn.expand '$LOCALAPPDATA/zoxide'
  else
    -- Linux/BSD - use XDG_DATA_HOME or default to ~/.local/share
    local base_dir = vim.env.XDG_DATA_HOME or vim.fn.expand '$HOME/.local/share'
    data_dir = base_dir .. '/zoxide'
  end
  vim.env._ZO_DATA_DIR = data_dir
end

-- [[ Setting options ]]
require 'options'

-- [[ Basic Keymaps ]]
require 'keymaps'

-- [[ Basic Autocommands ]]
require 'autocommands'

-- [[ Install `lazy.nvim` plugin manager ]]
require 'lazy-bootstrap'

-- [[ Configure and install plugins ]]
require 'lazy-plugins'

-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
