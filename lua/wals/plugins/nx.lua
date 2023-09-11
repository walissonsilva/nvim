return {
  "Equilibris/nx.nvim",
  config = function()
    require('nx').setup {}

    vim.keymap.set("n", "<leader>nxa", "<cmd>Telescope nx actions<CR>")
    vim.keymap.set("n", "<leader>nxg", "<cmd>Telescope nx generators<CR>")
  end
}
