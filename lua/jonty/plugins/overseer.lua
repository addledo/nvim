return {
  'stevearc/overseer.nvim',
  ---@module 'overseer'
  ---@type overseer.SetupOpts
  opts = {},
  keys = {
    { '<leader>o', '<cmd>OverseerToggle<CR>', desc = 'Overseer Toggle' },
    {
      '<leader>os',
      function()
        local cmd = vim.fn.input 'OverseerShell: '
        if cmd ~= '' then
          vim.cmd('OverseerShell ' .. cmd)
        end
      end,
      desc = 'Overseer shell command',
    },
    {
      '<leader>or',
      function()
        local overseer = require 'overseer'
        local task_list = require 'overseer.task_list'
        local tasks = overseer.list_tasks {
          status = { overseer.STATUS.SUCCESS, overseer.STATUS.FAILURE, overseer.STATUS.CANCELED },
          sort = task_list.sort_finished_recently,
        }
        if vim.tbl_isempty(tasks) then
          vim.notify('No tasks found', vim.log.levels.WARN)
        else
          overseer.run_action(tasks[1], 'restart')
        end
      end,
      desc = 'Overseer rerun last task',
    },
  },
}
