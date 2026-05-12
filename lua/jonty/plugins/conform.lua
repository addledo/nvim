return {
  'stevearc/conform.nvim',
  -- cmd = {'ConformInfo', 'Format'},
  event = 'VeryLazy',

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

  config = function()
    require('conform').setup {
      notify_on_error = true,
      format_on_save = nil,

      formatters_by_ft = {
        lua = { 'stylua' },
        json = { 'jq' },
        javascript = { 'prettier' },
        pascal = { 'jamie' },
        ps1 = { 'powershell', 'trim_whitespace', 'trim_newlines' },
        rust = { 'rustfmt' },

        -- Fallback if no other formatters
        ['_'] = { 'trim_whitespace', 'trim_newlines' },
      },

      formatters = {
        powershell = {
          -- {{{
          -- Powershell module must be installed:
          --   Install-Module -Name PSScriptAnalyzer -Scope CurrentUser -Force
          command = "powershell",
          args = {
            "-NoProfile",
            "-Command",
            "Invoke-Formatter -ScriptDefinition ($input | Out-String) | Out-String"
          },
          stdin = true,
          -- }}}
        },
        jamie = {
          -- {{{
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
          -- }}}
        }, --jamie
        delphi = {
          -- {{{
          inherit = false,
          stdin = false,
          condition = function()
            if vim.env.DELPHI_FORMATTER_CONFIG and vim.env.DELPHI_FORMATTER_CONFIG ~= '' then
              return true
            else
              vim.notify('Environment variable DELPHI_FORMATTER_CONFIG not found', vim.log.levels.ERROR)
              return false
            end
          end,
          cwd = function()
            return vim.fs.root(0, '.git')
          end,
          command = 'Formatter.exe',
          args = function()
            local repo = vim.fs.root(0, '.git')
            return {
              '-config',
              vim.fs.joinpath(repo, vim.env.DELPHI_FORMATTER_CONFIG),
              '$FILENAME',
            }
          end,
          -- }}}
        }, -- delphi
      },   -- formatters
    }
  end,

  vim.api.nvim_create_user_command('Format', function(opts)
    require('conform').format {
      formatters = { opts.args },
    }
  end, {
    nargs = 1,
    complete = function()
      return vim.tbl_keys(require('conform').formatters)
    end,
  }),
}
-- vim: ts=2 sw=2 et foldmethod=marker
