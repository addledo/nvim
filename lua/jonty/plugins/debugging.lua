return {
  {
    'mfussenegger/nvim-dap',
    dependencies = {
      'nvim-neotest/nvim-nio',
      'rcarriga/nvim-dap-ui',
      'theHamsta/nvim-dap-virtual-text',
      'williamboman/mason.nvim',
      'jay-babu/mason-nvim-dap.nvim',
    },

    keys = {
      -- Basic debugging keymaps, feel free to change to your liking!
      { '<F5>',      function() require('dap').continue() end,                                            desc = 'Debug: Start/Continue' },
      { '<F1>',      function() require('dap').step_into() end,                                           desc = 'Debug: Step Into' },
      { '<F2>',      function() require('dap').step_over() end,                                           desc = 'Debug: Step Over' },
      { '<F3>',      function() require('dap').step_out() end,                                            desc = 'Debug: Step Out' },
      -- { '<leader>b', function() require('dap').toggle_breakpoint() end,                                   desc = 'Debug: Toggle Breakpoint' },
      { '<leader>B', function() require('dap').set_breakpoint(vim.fn.input 'Breakpoint condition: ') end, desc = 'Debug: Set Conditional Breakpoint' },
      { '<leader>Dt',      function() require('dapui').toggle() end,                                            desc = 'Debug: Toggle UI' },
      { '<leader>Dx',      function() require('dap').terminate() end,                                           desc = 'Debug: Terminate' },
    },

    config = function()
      local dap = require 'dap'
      local ui = require 'dapui'

      ui.setup()
      require('nvim-dap-virtual-text').setup({})

      require('mason-nvim-dap').setup {
        automatic_installation = true,
        ensure_installed = {
          'codelldb',
          -- 'python',
        },
        handlers = {},
      }

      dap.configurations.rust = {
        {
          name = 'Debug',
          type = 'codelldb',
          request = 'launch',
          program = function()
            return vim.fn.input('Path to binary: ', '', 'file')
          end,
          cwd = '${workspaceFolder}',
          stopOnEntry = false,
        },
      }

      -- dap.configurations.python = {
      --   {
      --     type = 'python',
      --     request = 'launch',
      --     name = 'Launch file',
      --     program = '${file}',
      --   },
      -- }


      dap.listeners.before.attach.dapui_config = function()
        ui.open()
      end
      dap.listeners.before.launch.dapui_config = function()
        ui.open()
      end
      dap.listeners.before.event_terminated.dapui_config = function()
        ui.close()
      end
      dap.listeners.before.event_exited.dapui_config = function()
        ui.close()
      end
    end,
  },
}
