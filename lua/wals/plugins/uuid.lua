return {
	"TrevorS/uuid-nvim",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		-- optional configuration
		require("uuid-nvim").setup({
			case = "lower",
		})

		local uuid = require("uuid-nvim")

		vim.keymap.set("n", "<leader>ut", uuid.toggle_highlighting)
		vim.keymap.set("i", "<C-u>", uuid.insert_v4)
	end,
}
