return {
	{
		"MeanderingProgrammer/render-markdown.nvim",
		dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-tree/nvim-web-devicons" },
		---@module 'render-markdown'
		---@type render.md.UserConfig
		opts = {},
	},
	{
		"iamcco/markdown-preview.nvim",
		cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
		build = "cd app && yarn install",
		init = function()
			vim.g.mkdp_filetypes = { "markdown" }
		end,
		ft = { "markdown" },
		config = function()
			vim.keymap.set("n", "<C-p>", ":MarkdownPreviewToggle<CR>", {})
		end,
	},
	{
		"jubnzv/mdeval.nvim",
		config = function()
			require("mdeval").setup({})
		end,
	},
	{
		"Nedra1998/nvim-mdlink",
		config = function()
			require("nvim-mdlink").setup({
				keymap = true,
				cmp = true,
			})
		end,
	},
	{
		"toppair/peek.nvim",
		event = { "VeryLazy" },
		build = "deno task --quiet build:fast",
		config = function()
			require("peek").setup({
				auto_load = false,
				close_on_bdelete = true, -- close preview window on buffer delete
				syntax = false,
				theme = "dark",
				update_on_change = true,
				app = "browser",
				filetype = { "markdown" },
				throttle_at = 200000,
				throttle_time = "auto",
			})

			vim.api.nvim_create_user_command("PeekOpen", require("peek").open, {})
			vim.api.nvim_create_user_command("PeekClose", require("peek").close, {})

			vim.keymap.set("n", "<leader>mp", ":PeekOpen<Cr>", {})
			vim.keymap.set("n", "<leader>mc", ":PeekClose<Cr>", {})
		end,
	},
	{
		"SCJangra/table-nvim",
		ft = "markdown",
		opts = {},
	},
	{
		"richardbizik/nvim-toc",
		config = function()
			require("nvim-toc").setup({
				toc_header = "Table of Contents",
			})
		end,
	},
}
