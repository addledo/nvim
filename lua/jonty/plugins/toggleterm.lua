local function vertical_half()
  return math.floor(vim.o.columns / 2)
end

local function run_in_vertical(cmd)
  vim.cmd('TermExec cmd="' .. cmd .. '" direction=vertical size=' .. vertical_half())
end

return {
  'akinsho/toggleterm.nvim',
  event = 'VeryLazy',
  enabled = true,
  version = '*',
  opts = {
    shell = global_shell,
    -- direction = 'float',
    float_opts = { border = 'curved' },
    -- size = 15,
  },
  keys = {
    {
      '<leader>tt',
      '<cmd>ToggleTerm direction=float<CR>',
      desc = 'Float terminal',
    },
    {
      '<leader>tb',
      '<cmd>ToggleTerm direction=horizontal<CR>',
      desc = 'Bottom terminal',
    },
    {
      '<leader>tv',
      function()
        vim.cmd('ToggleTerm direction=vertical size=' .. vertical_half())
      end,
      desc = 'Vertical terminal',
    },
    {
      '<leader>th',
      function()
        require('toggleterm.terminal').Terminal:new({ direction = 'vertical', size = 100, dir = vim.fn.expand '%:p:h' }):toggle()
      end,
      desc = 'Terminal here',
    },
    {
      '<leader>td',
      function()
        local term = require('toggleterm.terminal').get_focused_terminal()
        if term then
          term:shutdown()
        end
      end,
      mode = 't',
      desc = 'Terminal destroy',
    },

    -- Send Rust commands
    {
      '<leader>trt',
      function()
        local args = vim.fn.input 'cargo test args: '
        run_in_vertical('cargo test' .. (args ~= '' and ' ' .. args or ''))
      end,
      desc = 'Rust: cargo test',
    },
    {
      '<leader>trr',
      function()
        local args = vim.fn.input 'cargo run args: '
        run_in_vertical('cargo run -q --' .. (args ~= '' and ' ' .. args or ''))
      end,
      desc = 'Rust: cargo run',
    },
  },
}
