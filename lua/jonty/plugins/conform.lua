return {
  'stevearc/conform.nvim',
  cmd = 'ConformInfo',

  keys = {
    {
      '<leader>F',
      function()
        require('conform').format { async = true, lsp_format = 'fallback' }
      end,
      mode = 'n',
      desc = 'Format buffer',
    },
  },

  opts = {
    notify_on_error = false,
    format_on_save = false,

    formatters_by_ft = {
      lua = { 'stylua' },
      json = { 'jq' },
      pascal = { 'delphi_formatter' },
      ps1 = { 'lsp' },
      rust = { 'rustfmt' },

      -- Fallback if no other formatters
      ['_'] = { 'trim_whitespace', 'trim_newlines' },
    },

    formatters = {
      delphi_formatter = {
        inherit = false,
        stdin = false,
        condition = function()
          if vim.env.DELPHI_SORTER and vim.env.DELPHI_SORTER ~= '' then
            return true
          else
            vim.notify('Environment variable DELPHI_SORTER not found', vim.log.levels.ERROR)
            return false
          end
        end,
        cwd = function()
          return vim.fs.root(0, '.git')
        end,
        command = 'python',
        args = function()
          local repo = vim.fs.root(0, '.git')
          return {
            vim.fs.joinpath(repo, vim.env.DELPHI_SORTER),
            '$FILENAME',
          }
        end,
      }, --delphi
    }, -- formatters
  }, -- opts
}
-- vim: ts=2 sts=2 sw=2 et
