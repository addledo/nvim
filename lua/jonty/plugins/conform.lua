return {
  'stevearc/conform.nvim',
  event = { 'BufWritePre' },
  cmd = { 'ConformInfo' },

  keys = {
    {
      '<leader>F',
      function()
        require('conform').format { async = true, lsp_format = 'fallback' }
      end,
      mode = '',
      desc = '[F]ormat buffer',
    },
  },

  opts = {
    notify_on_error = false,
    format_on_save = false,

    formatters_by_ft = {
      lua = { 'stylua' },
      json = { 'jq' },
      pascal = { 'delphi_formatter' },

      -- Fallback if no other formatters
      ['_'] = { 'trim_whitespace', 'trim_newlines' },
    },

    formatters = {
      delphi_formatter = {
        inherit = false,
        stdin = false,
        command = 'python',
        args = function()
          local repo = vim.fs.root(0, '.git')
          local sort_repo_location = vim.env.DELPHI_SORTER
          if sort_repo_location then
            return {
              vim.fs.joinpath(repo, sort_repo_location),
              '$FILENAME',
            }
          else
            vim.notify('Environment variable DELPHI_SORTER not found', vim.log.levels.WARN)
            return {}
          end
        end,
      }, --delphi
    }, -- formatters
  }, -- opts
}
-- vim: ts=2 sts=2 sw=2 et
