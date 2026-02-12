-- custom/plugins/harpoon.lua
return {
  'ThePrimeagen/harpoon',
  branch = 'harpoon2',
  dependencies = { 'nvim-lua/plenary.nvim', 'folke/which-key.nvim' },
  config = function()
    local harpoon = require 'harpoon'

    harpoon:setup()

    -- Add file
    vim.keymap.set('n', '<leader>ha', function()
      harpoon:list():add()
    end, { desc = 'Harpoon add file' })

    -- Quick menu
    vim.keymap.set('n', '<C-h>', function()
      harpoon.ui:toggle_quick_menu(harpoon:list())
    end, { desc = 'Harpoon quick menu' })

    -- Main files keybinds:
    vim.keymap.set('n', '<C-j>', function()
      harpoon:list():select(1)
    end, { desc = 'Harpoon to file 1' })

    vim.keymap.set('n', '<C-k>', function()
      harpoon:list():select(2)
    end, { desc = 'Harpoon to file 2' })

    vim.keymap.set('n', '<C-l>', function()
      harpoon:list():select(3)
    end, { desc = 'Harpoon to file 3' })

    vim.keymap.set('n', '<C-;>', function()
      harpoon:list():select(4)
    end, { desc = 'Harpoon to file 4' })

    -- Next and previous file
    vim.keymap.set('n', '<C-S-P>', function()
      harpoon:list():prev()
    end, { desc = 'Harpoon previous file' })

    vim.keymap.set('n', '<C-S-N>', function()
      harpoon:list():next()
    end, { desc = 'Harpoon next file' })

    -- Which-key group
    local wk = require 'which-key'
    wk.add {
      { '<leader>h', group = 'Harpoon' },
    }
  end,
}
