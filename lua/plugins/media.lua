return {
	{
		"edluffy/hologram.nvim",
		config = function()
			if not vim.g.neovide then
				require("hologram").setup({
					auto_display = true,
				})
			end
		end,
	},
	{
		"HakonHarnes/img-clip.nvim",
		event = "VeryLazy",
		opts = {},
		keys = {
			{ "<leader>p", "<cmd>PasteImage<cr>", desc = "Paste image from system clipboard" },
		},
	},
}
