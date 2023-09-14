return {
  "akinsho/bufferline.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  version = "*",
  opts = {
    options = {
      mode = "tabs",
      separator_style = "slant",
      diagnostics = "nvim_lsp",
      indicator = {
        style = 'icon',
      },
    },
  },
}
