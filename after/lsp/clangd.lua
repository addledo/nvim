return {
  cmd = {
    'clangd',
    '--query-driver=/Users/jonty/.platformio/packages/toolchain-gccarmnoneeabi/bin/arm-none-eabi-*',
  },

  root_dir = function(bufnr, on_dir)
    local fname = vim.api.nvim_buf_get_name(bufnr)
    local start = vim.fs.dirname(fname)

    local root = vim.fs.find({ 'compile_commands.json', 'platformio.ini', '.git' }, {
      path = start,
      upward = true,
      stop = vim.uv.os_homedir(),
      limit = 1,
    })[1]

    on_dir(root and vim.fs.dirname(root) or vim.fn.getcwd())
  end,
}
