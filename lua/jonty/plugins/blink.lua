return {
  'saghen/blink.cmp',

  enabled = true,

  dependencies = {
    'rafamadriz/friendly-snippets',
    {
      'mikavilpas/blink-ripgrep.nvim',
      version = '*', -- use the latest stable version
    },
  },

  version = '1.*',

  opts = {
    -- keymap = { preset = 'default' },
    keymap = { preset = 'super-tab' },

    appearance = {
      nerd_font_variant = 'mono',
    },

    -- (Default) Only show the documentation popup when manually triggered
    completion = { documentation = { auto_show = false } },

    -- Default list of enabled providers defined so that you can extend it
    -- elsewhere in your config, without redefining it, due to `opts_extend`
    sources = {
      -- default = { 'lsp', 'path', 'snippets', 'buffer' },
      default = { 'ripgrep', 'path', 'snippets', 'buffer' },

      providers = {
        ripgrep = {
          module = 'blink-ripgrep',
          name = 'Ripgrep',
          opts = {
            backend = {
              use = 'ripgrep',
              ripgrep = {
                additional_rg_options = {
                  -- Ignore this directory for completions
                  '--glob',
                  '!**/Delphi/Testing/**',
                },
              },
            },
          },
        },
      },
    },

    fuzzy = { implementation = 'prefer_rust_with_warning' },
  },

  opts_extend = { 'sources.default' },
}
