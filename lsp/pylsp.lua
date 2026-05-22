return {
  settings = {
    pylsp = {
      plugins = {
        pycodestyle = {
          ignore = {
              'E501' -- Line too long
          },
        },
      },
    },
  },
}
