-- [[ Basic Keymaps ]]

-- Clear highlights on search when pressing <Esc> in normal mode
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Diagnostic keymaps
-- Set in quicker.lua:
-- vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

--  Use CTRL+<hjkl> to switch between windows
vim.keymap.set('n', '<leader>j', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<leader>k', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- Buffer delete
vim.keymap.set('n', '<leader>c', '<CMD>:bd<CR>', { desc = '[C]lose Buffer' })

-- Select all
vim.keymap.set('n', '<leader>A', 'ggVG', { desc = 'Select all' })

-- Keymaps for sourcing lua
vim.keymap.set('n', '<leader>x', ':.lua<CR>', { desc = 'Source current line' })
vim.keymap.set('v', '<leader>x', ':lua<CR>', { desc = 'Source current selection' })

-- Make invoice
-- vim.keymap.set('n', '<leader>m', ':silent w | !python make_invoice.py<CR>', { desc = '[M]ake invoice'})
vim.keymap.set('n', '<leader>m', function()
  vim.cmd 'silent write'
  vim.cmd 'silent !python make_invoice.py > /dev/null 2>&1'
end, { desc = '[M]ake invoice' })

-- Note -- Some terminals have colliding keymaps or are not able to send distinct keycodes
--
-- vim.keymap.set("n", "<C-S-h>", "<C-w>H", { desc = "Move window to the left" })
-- vim.keymap.set("n", "<C-S-l>", "<C-w>L", { desc = "Move window to the right" })
-- vim.keymap.set("n", "<C-S-j>", "<C-w>J", { desc = "Move window to the lower" })
-- vim.keymap.set("n", "<C-S-k>", "<C-w>K", { desc = "Move window to the upper" })

-- -----------------------------------------------------------------------------------------------------------
-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })
---------------------------------------------------------------------------------------------------------------

-- vim: ts=2 sts=2 sw=2 et
