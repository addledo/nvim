-- [[ Basic Autocommands ]]
--  See `:help lua-guide-autocommands`

-- Highlight when yanking (copying) text
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.hl.on_yank()
  end,
})

-- Set directory to argument given
-- local group_cdpwd = vim.api.nvim_create_augroup("group_cdpwd", { clear = true })
-- vim.api.nvim_create_autocmd("VimEnter", {
--   group = group_cdpwd,
--   pattern = "*",
--   callback = function()
--     vim.api.nvim_set_current_dir(vim.fn.expand("%:p:h"))
--   end,
-- })
