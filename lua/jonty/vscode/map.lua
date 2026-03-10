local vscode = require('vscode')

vim.keymap.set('n', '<leader>F', function()
  vscode.call 'editor.action.formatDocument'
end)

vim.keymap.set('n', '<leader>ff', function()
  vscode.call 'workbench.action.quickOpen'
end)

vim.keymap.set('n', '<leader>sg', function()
  vscode.call 'workbench.action.findInFiles'
end)

vim.keymap.set('n', '<leader>ss', function()
  vscode.call 'workbench.action.gotoSymbol'
end)

vim.keymap.set('n', '<leader>sS', function()
  vscode.call 'workbench.action.showAllSymbols'
end)

vim.keymap.set('n', ']c', function()
  vscode.call 'workbench.action.editor.nextChange'
end)

vim.keymap.set('n', '[c', function()
  vscode.call 'workbench.action.editor.previousChange'
end)

vim.keymap.set('n', ']d', function()
  vscode.call 'editor.action.marker.next'
end)

vim.keymap.set('n', '[d', function()
  vscode.call 'editor.action.marker.previous'
end)

vim.keymap.set('n', '<leader>t', function()
  vscode.call 'workbench.action.terminal.toggleTerminal'
end)

-- Git
vim.keymap.set("x", "<leader>hs", function()
  vscode.action("git.stageSelectedRanges")
end)

vim.keymap.set("x", "<leader>hr", function()
  vscode.action("git.revertSelectedRanges")
end)

vim.keymap.set("n", "<leader>hu", function()
  vscode.action("git.unstage")
end)

vim.keymap.set("n", "<leader>hS", function()
  vscode.action("git.stage")
end)

vim.keymap.set("n", "<leader>hR", function()
  vscode.action("git.clean")
end)

