return {
	"mhartington/oceanic-next",
	config = function()
		vim.cmd([[
      if (has("termguicolors"))
        set termguicolors
      endif
    ]])

		vim.cmd("syntax enable")
		vim.cmd.colorscheme("OceanicNext")
	end,
}
