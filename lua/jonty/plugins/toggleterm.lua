return {
  "akinsho/toggleterm.nvim",
  event = "VeryLazy",
  enabled = true,
  version = "*",
  opts = {
    shell = global_shell,
    direction = "float",
    float_opts = { border = "curved" },
    -- size = 15,
  },
  keys = {
    {
      "<leader>tt",
      function()
        local Terminal = require("toggleterm.terminal").Terminal
        _G._float_term = _G._float_term or Terminal:new({ direction = "float" })
        _G._float_term:toggle()
      end,
      desc = "Float terminal",
    },
    {
      "<leader>tb",
      function()
        local Terminal = require("toggleterm.terminal").Terminal
        _G._bottom_term = _G._bottom_term or Terminal:new({ direction = "horizontal" })
        _G._bottom_term:toggle()
      end,
      desc = "Bottom terminal",
    },
  },
}
