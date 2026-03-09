return {
  cmd = { 'Delphi13LSP64.exe' },
  filetypes = { 'pascal' },
  -- root_markers = { 'MotorCAD_Group.groupproj', '.git' },

  root_dir = function(bufnr, on_dir)
    local fname = vim.api.nvim_buf_get_name(bufnr)
    local start = vim.fs.dirname(fname)

    local groupproj = vim.fs.find(function(name)
      return name:match '%.groupproj$' ~= nil
    end, {
      path = start,
      upward = true,
      stop = vim.uv.os_homedir(),
      type = 'file',
      limit = 1,
    })[1]

    local git = vim.fs.find('.git', {
      path = start,
      upward = true,
      stop = vim.uv.os_homedir(),
      limit = 1,
    })[1]

    local marker = groupproj or git
    -- Return dir of marker, if dir exists. Otherwise return cwd.
    on_dir(marker and vim.fs.dirname(marker) or vim.fn.getcwd())
  end,
}
