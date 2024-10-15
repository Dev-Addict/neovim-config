return {
	"akinsho/toggleterm.nvim",
	version = "*",
	config = function()
		require("toggleterm").setup({
			open_mapping = [[<C-t>]],
			insert_mappings = true,
			auto_scroll = true,
		})
	end,
}
