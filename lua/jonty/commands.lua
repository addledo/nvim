-- Written by Claude:
-- Add changed files from a git range to quickfix list
vim.api.nvim_create_user_command('DiffQuickfix', function(opts)
  local range = opts.args ~= '' and opts.args or 'main...HEAD'
  local files = vim.fn.systemlist('git diff --name-only --relative ' .. range)

  if vim.v.shell_error ~= 0 then
    vim.notify('Git command failed', vim.log.levels.ERROR)
    return
  end

  if #files == 0 then
    return
  end

  local qf_list = {}
  for _, file in ipairs(files) do
    table.insert(qf_list, { filename = file, lnum = 1 })
  end

  vim.fn.setqflist(qf_list)
  vim.cmd 'copen'
end, {
  nargs = '?',
  desc = 'Add git diff files to quickfix list (default: main...HEAD)',
})
