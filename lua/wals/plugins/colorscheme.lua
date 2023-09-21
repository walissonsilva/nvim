return {
  "catppuccin/nvim",
  lazy = false,
  priority = 1000,
  config = function()
    require("catppuccin").setup({
      flavour = "mocha", -- latte, frappe, macchiato, mocha
      background = {     -- :h background
        light = "latte",
        dark = "mocha",
      },
      transparent_background = true, -- disables setting the background color.
      term_colors = true,            -- sets terminal colors (e.g. `g:terminal_color_0`)
    })
    vim.cmd([[colorscheme catppuccin-mocha]])
  end,
}
