return {
  { 'nvim-treesitter/nvim-treesitter', build = ':TSUpdate' },
  {
    "baliestri/aura-theme",
    lazy = false,
    priority = 1000,
    config = function(plugin)
      vim.opt.rtp:append(plugin.dir .. "/packages/neovim")
      vim.cmd([[colorscheme aura-dark]])
    end
  }
}
-- return {
-- 	"catppuccin/nvim",
-- 	lazy = false,
-- 	priority = 1000,
-- 	config = function()
-- 		-- require("tokyonight").setup({
-- 		--   style = "storm",
-- 		--   transparent = true,
-- 		--   styles = {
-- 		--     sidebars = "transparent",
-- 		--     floats = "transparent",
-- 		--     show_tab_indicators = true,
-- 		--   },
-- 		-- })
-- 		vim.cmd([[colorscheme catppuccin]])
-- 	end,
-- }
