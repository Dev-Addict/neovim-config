return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		"MunifTanjim/nui.nvim",
		"3rd/image.nvim",
	},
	config = function()
		require("neo-tree").setup({
			filesystem = {
				visible = true,
				hide_dotfiles = false,
				hide_gitignored = false,
			},
		})
		vim.keymap.set("n", "<leader>n", ":Neotree toggle<CR>", {})
	end,
}
