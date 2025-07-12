return {
	{
		"dmmulroy/tsc.nvim",
		config = function()
			require("tsc").setup()

			vim.keymap.set("n", "<leader>to", ":TSCOpen<CR>")
			vim.keymap.set("n", "<leader>tc", ":TSCClose<CR>")
		end,
	},
	{
		"dmmulroy/ts-error-translator.nvim",
		config = function()
			require("ts-error-translator").setup()
		end,
	},
}
