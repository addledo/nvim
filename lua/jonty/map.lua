vim.g.mapleader = ' '
vim.g.maplocalleader = '\\'

-- Keymaps for cumulitive yanking into a buffer
vim.keymap.set('n', '<leader>yl', '"lyy', { desc = 'Overwite cumulitive buffer with line' })
vim.keymap.set('n', '<leader>ya', '"Lyy', { desc = 'Add line to cumulitive buffer' })
vim.keymap.set('v', '<leader>yl', '"ly', { desc = 'Overwite cumulitive buffer with selection' })
vim.keymap.set('v', '<leader>ya', '"Ly', { desc = 'Add selection to cumulitive buffer' })
vim.keymap.set('n', '<leader>yp', '"lp', { desc = 'Put cumulative buffer' })
vim.keymap.set('n', '<leader>yP', '"lP', { desc = 'Put cumulative buffer above' })

-- Clear highlights on search when pressing <Esc> in normal mode
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Highlight word
vim.keymap.set('n', '<leader>hw', function()
  local word = vim.fn.expand '<cword>'
  vim.fn.setreg('/', '\\<' .. vim.fn.escape(word, '\\/') .. '\\>')
  vim.o.hlsearch = true
end, { desc = 'Highlight word under cursor' })

-- Keymap for next quickfix
vim.keymap.set('n', '<leader>;', ':cnext<CR>')

-- Close buffer
vim.keymap.set('n', '<leader>x', '<CMD>:bd<CR>', { desc = 'Close Buffer' })

-- Select all
vim.keymap.set('n', '<leader>fh', 'ggVG', { desc = 'Select all' })

-- Yank all
vim.keymap.set('n', '<leader>fy', function()
  local cur = vim.fn.getpos '.'
  vim.cmd 'keepjumps normal! gg"+yG'
  vim.fn.setpos('.', cur)
end, { desc = 'Yank whole file to clipboard' })

-- Yank selection to system clipboard
vim.keymap.set('x', '<leader>y', '"+y', { desc = 'Yank to clipboard' })
vim.keymap.set('n', '<leader>yy', '"+yy', { desc = 'Yank line to clipboard' })

-- Keymaps for sourcing lua
vim.keymap.set('n', '<leader>x', ':.lua<CR>', { desc = 'Source current line' })
vim.keymap.set('v', '<leader>x', ':lua<CR>', { desc = 'Source current selection' })

-- Exit terminal mode
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- Enable C-w window maps for teminal mode
vim.keymap.set('t','<C-w>', '<C-\\><C-n><C-w>')

-- Change directory commands
-- cd to repo root
vim.keymap.set('n', '<leader>dr', function()
  local root = vim.fs.root(0, { '.git' })
  if root then
    vim.cmd.cd(root)
  end
end, { desc = 'cd to repo root' })

-- cd to current file's directory
vim.keymap.set('n', '<leader>.', function()
  vim.cmd.cd(vim.fn.expand '%:p:h')
end, { desc = 'cd to to the current file' })

-- cd one up
vim.keymap.set('n', '<leader>..', function()
  vim.cmd.cd '..'
end, { desc = 'cd to the parent directory' })

-- print directory
vim.keymap.set('n', '<leader>dp', '<CMD>:pwd<CR>')

-- Source keymap (this) file
vim.keymap.set('n', '<leader>ks', function()
  local file = vim.fn.stdpath 'config' .. '/lua/jonty/map.lua'
  dofile(file)
end, { desc = 'Source jonty/map.lua' })

-- Show lsp help
vim.keymap.set('i', '<C-l>', vim.lsp.buf.signature_help, { desc = 'LSP: Signature help' })

-- Close window
vim.keymap.set('n', '<leader>wq', '<C-w>q', { desc = 'Close window' })

-- Close other windows
vim.keymap.set('n', '<leader>wo', '<C-w>o', { desc = 'Only window' })
