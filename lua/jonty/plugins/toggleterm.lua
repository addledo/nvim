return {
  'akinsho/toggleterm.nvim',
  event = 'VeryLazy',
  enabled = true,
  version = '*',
  config = function()
    local sh
    if jit then
      if jit.os == "Windows" then
        sh = vim.fn.executable("pwsh") and "pwsh" or "powershell"
      elseif vim.fn.executable("zsh") then
        vim.o.shell = "zsh"
      else
        vim.o.shell = "bash"
      end
    end
    require 'toggleterm'.setup {
      shell = sh,
      open_mapping = [[<c-\>]],
      direction = 'float',
      float_opts = { border = 'curved' },
    }
  end
}
