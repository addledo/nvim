-- Highlight when yanking text
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.hl.on_yank()
  end,
})


-- Restore previous position when opening file
vim.api.nvim_create_autocmd('BufReadPost', {
  callback = function()
    local line = vim.fn.line('\'"')
    if line > 0 and line <= vim.fn.line('$') then vim.cmd([[normal! g'"]]) end
  end,
})
