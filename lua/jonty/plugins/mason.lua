return {
  'mason-org/mason-lspconfig.nvim',
  event = 'VeryLazy',
  opts = {
    ensure_installed = { 'lua_ls', 'tree-sitter-cli' },
  },
  dependencies = {
    { 'mason-org/mason.nvim', opts = {} },
    'neovim/nvim-lspconfig',
  },
}
