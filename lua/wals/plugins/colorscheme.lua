return {
	"folke/tokyonight.nvim",
	lazy = false,
	priority = 1000,
	config = function()
		require("tokyonight").setup({
			style = "storm",
			transparent = true,
			styles = {
				sidebars = "transparent",
				floats = "transparent",
				show_tab_indicators = true,
			},
		})
		vim.cmd([[colorscheme tokyonight-night]])
	end,
}
