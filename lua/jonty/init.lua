require 'jonty.options'
require 'jonty.map'
require 'jonty.autocommands'
require 'jonty.commands'
require 'jonty.delphi'

-- Kanata (.kbd) {{{
vim.filetype.add({ extension = { kbd = 'kanata' } })

local kanata_group = vim.api.nvim_create_augroup('jonty.kanata', { clear = true })

vim.api.nvim_create_autocmd('FileType', {
  group = kanata_group,
  pattern = 'kanata',
  callback = function(args)
    vim.bo[args.buf].commentstring = ';; %s'
    vim.bo[args.buf].comments = ':;;'
  end,
})

-- `;;` line comments and `#| ... |#` block comments.
-- A lone `;` is a key, so it is not treated as a comment.
-- Scheduled because Nvim's own Syntax handler (registered after init.lua)
-- runs `syntax clear` after this autocmd.
vim.api.nvim_create_autocmd('Syntax', {
  group = kanata_group,
  pattern = 'kanata',
  callback = function(args)
    vim.schedule(function()
      if not vim.api.nvim_buf_is_valid(args.buf) then return end
      vim.api.nvim_buf_call(args.buf, function()
        vim.cmd([[
          syntax match  kanataComment /;;.*$/ contains=@Spell
          syntax region kanataComment start=/#|/ end=/|#/ contains=@Spell
          highlight default link kanataComment Comment
        ]])
      end)
    end)
  end,
})
-- }}}

if vim.g.vscode then
  require 'jonty.vscode.map'
  require 'jonty.vscode.lazy'
else
  require 'jonty.lazy'

  vim.lsp.enable 'delphi_lsp'
  vim.lsp.enable 'sourcekit'

  -- Filter annoying warnings for DelphiLSP
  vim.lsp.handlers['window/showMessage'] = function(_, result, ctx)
    local client = vim.lsp.get_client_by_id(ctx.client_id)
    local client_name = client and client.name or ''

    -- Suppress the DelphiLSP respawn message
    if client_name == 'delphi_lsp' and result.message:match 'terminated and will be respawned' then
      return
    end

    -- Show all other messages normally
    vim.notify(result.message, vim.log.levels.INFO)
  end
end

-- vim: foldmethod=marker
