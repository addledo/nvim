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
        command = 'Formatter.exe',
        args = function()
          local repo = vim.fs.root(0, '.git')
          return {
            '-config',
            repo .. '/DevelopmentEnvironment/delphi_formatter.config',
            '$FILENAME',
          }
        end,
      }, --delphi
    }, -- formatters
  }, -- opts
}
-- vim: ts=2 sts=2 sw=2 et
