require 'toggleterm'.setup {
  shade_terminals = false
}

vim.keymap.set('t', '<C-\\>', vim.cmd.ToggleTerm)
vim.keymap.set('n', '<C-\\>', vim.cmd.ToggleTerm)
