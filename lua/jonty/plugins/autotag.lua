return {
  {
    'windwp/nvim-ts-autotag',
    event = "InsertEnter",

    -- Weird structure to fix warning
    -- https://github.com/windwp/nvim-ts-autotag/issues/248#issuecomment-3246321335
    opts = {
      opts = {
        enable_close = true,
        enable_rename = true,
        enable_close_on_slash = false,
      },
      per_filetype = {
        ['html'] = { enable_close = false },
      },
    },
  },
}
