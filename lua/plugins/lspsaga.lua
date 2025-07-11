return {
	"nvimdev/lspsaga.nvim",
	config = function()
		require("lspsaga").setup({
			ui = {
				code_action = "",
			},
			symbol_in_winbar = {
				enable = true,
			},
			lightbulb = {
				enable = false,
			},
		})

		vim.keymap.set("n", "K", ":Lspsaga hover_doc<Cr>", {})
		vim.keymap.set("n", "<leader>gi", ":Lspsaga incoming_calls<Cr>", {})
		vim.keymap.set("n", "<leader>go", ":Lspsaga outgoing_calls<Cr>", {})
		vim.keymap.set({ "n", "v" }, "<leader>ca", ":Lspsaga code_action<Cr>", {})
		vim.keymap.set("n", "gr", ":Lspsaga finder<Cr>", {})
		vim.keymap.set("n", "<leader>o", ":Lspsaga outline<Cr>", {})
		vim.keymap.set("n", "<leader>rn", ":Lspsaga rename ++project<Cr>", {})
	end,
	dependencies = {
		"nvim-treesitter/nvim-treesitter",
		"nvim-tree/nvim-web-devicons",
	},
}
