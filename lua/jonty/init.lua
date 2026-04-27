require 'jonty.options'
require 'jonty.map'
require 'jonty.autocommands'
require 'jonty.commands'
require 'jonty.delphi'

if vim.g.vscode then
  require 'jonty.vscode.map'
  require 'jonty.vscode.lazy'
else
  require 'jonty.lazy'

  vim.lsp.enable 'delphi_lsp'

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
