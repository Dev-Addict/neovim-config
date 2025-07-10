return {
	"shellRaining/hlchunk.nvim",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		require("hlchunk").setup({
			chunk = {
				enable = true,
				chars = {
					horizontal_line = "─",
					vertical_line = "│",
					left_top = "┌",
					left_bottom = "└",
					right_arrow = "─",
				},
				style = "#c594c5",
			},
			indent = {
				enable = true,
				chars = {
					"│",
					"¦",
					"┆",
					"┊",
				},
				style = {
					vim.fn.synIDattr(vim.fn.synIDtrans(vim.fn.hlID("Whitespace")), "fg", "gui"),
				},
			},
			line_num = {
				enable = true,
				style = "#c594c5",
			},
			blank = {
				enable = true,
				chars = {
					" ",
				},
				style = {
					{ bg = "#434437" },
					{ bg = "#2f4440" },
					{ bg = "#433054" },
					{ bg = "#284251" },
				},
			},
		})
	end,
}
