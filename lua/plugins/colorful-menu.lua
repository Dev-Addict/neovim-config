return {
	"xzbdmw/colorful-menu.nvim",
	config = function()
		require("colorful-menu").setup({
			fallback_highlight = "@variable",
			max_width = 60,
		})
	end,
}
