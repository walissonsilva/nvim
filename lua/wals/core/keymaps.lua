vim.g.mapleader = " "

local keymap = vim.keymap

keymap.set("n", "<leader>pv", vim.cmd.Ex)

keymap.set('n', '<leader>q', '<cmd>q<cr>')
keymap.set('n', '<leader>w', '<cmd>wa<cr>')
keymap.set('n', '<leader>x', '<cmd>x<cr>')

keymap.set('n', '<c-a>', 'ggVG')

keymap.set('v', 'J', ":m '>+1<CR>gv=gv")
keymap.set('v', 'K', ":m '<-2<CR>gv=gv")

keymap.set("n", '<C-d>', '<C-d>zz')
keymap.set("n", '<C-u>', '<C-u>zz')

keymap.set("n", 'n', 'nzzzv')
keymap.set("n", 'N', 'Nzzzv')

keymap.set({"n", "v"}, "<leader>y", [["+y]])
keymap.set("n", "<leader>Y", [["+Y]])

keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")

-- Navigation between tabs
keymap.set("n", "<Tab>", "<cmd>tabn<cr>")
keymap.set("n", "<S-Tab>", vim.cmd.tabp)

-- Navigation between buffers
keymap.set("n", "<A-Right>", vim.cmd.bn)
keymap.set("n", "<A-Left>", vim.cmd.bp)