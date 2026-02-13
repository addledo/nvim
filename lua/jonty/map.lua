vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Clear highlights on search when pressing <Esc> in normal mode
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Window switching
vim.keymap.set('n', '<leader>j', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<leader>k', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- Close buffer
vim.keymap.set('n', '<leader>x', '<CMD>:bd<CR>', { desc = 'Close Buffer' })

-- Select all
vim.keymap.set('n', '<leader>fh', 'ggVG', { desc = 'Select all' })

-- Yank all
vim.keymap.set('n', '<leader>fy', function()
  local cur = vim.fn.getpos('.')
  vim.cmd('keepjumps normal! gg"+yG')
  vim.fn.setpos('.', cur)
end, { desc = 'Yank whole file to clipboard' })

-- Keymaps for sourcing lua
vim.keymap.set('n', '<leader>x', ':.lua<CR>', { desc = 'Source current line' })
vim.keymap.set('v', '<leader>x', ':lua<CR>', { desc = 'Source current selection' })
