return {
  {
    'MeanderingProgrammer/render-markdown.nvim',
    enabled = false,
    ft = 'markdown',
    dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.nvim' }, -- if you use the mini.nvim suite
    opts = {},
  },

  {
    'OXY2DEV/markview.nvim',
    lazy = false,
    -- Completion for `blink.cmp`
    -- dependencies = { "saghen/blink.cmp" },
  },

  -- install with yarn or npm
  {
    'iamcco/markdown-preview.nvim',
    enabled = false,
    cmd = { 'MarkdownPreviewToggle', 'MarkdownPreview', 'MarkdownPreviewStop' },
    build = 'cd app && yarn install',
    init = function()
      vim.g.mkdp_filetypes = { 'markdown' }
    end,
    ft = { 'markdown' },
  },
}
