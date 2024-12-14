return {
	"elentok/format-on-save.nvim",
	config = function()
		local formatters = require("format-on-save.formatters")

		require("format-on-save").setup({
			experiments = {
				partial_update = "diff",
			},
			formatter_by_ft = {
				css = formatters.lsp,
				html = formatters.lsp,
				java = formatters.lsp,
				javascript = formatters.lsp,
				json = formatters.lsp,
				lua = formatters.lsp,
				markdown = formatters.prettierd,
				python = formatters.black,
				rust = formatters.lsp,
				scss = formatters.lsp,
				sh = formatters.shfmt,
				typescript = formatters.prettierd,
				typescriptreact = formatters.prettierd,
				yaml = formatters.lsp,
				go = {
					formatters.shell({
						cmd = { "goimports-reviser", "-rm-unused", "-set-alias", "-format", "%" },
						tempfile = function()
							return vim.fn.expand("%") .. ".formatter-temp"
						end,
					}),
					formatters.shell({ cmd = { "gofmt" } }),
				},
			},
		})
	end,
}
