return {
	"willothy/nvim-cokeline",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		"stevearc/resession.nvim",
		"famiu/bufdelete.nvim",
	},
	config = function()
		local is_picking_focus = require("cokeline.mappings").is_picking_focus
		local is_picking_close = require("cokeline.mappings").is_picking_close
		local get_hex = require("cokeline.hlgroups").get_hl_attr

		local red = vim.g.terminal_color_1
		local green = vim.g.terminal_color_2
		local yellow = vim.g.terminal_color_3
		local blue = vim.g.terminal_color_4

		local cokeline = require("cokeline")

		cokeline.setup({
			show_if_buffers_are_at_least = 2,
			buffers = {
				new_buffers_position = "directory",
			},
			components = {
				{
					text = "｜",
					fg = function(buffer)
						return buffer.is_modified and yellow or green
					end,
				},
				{
					text = function(buffer)
						return (is_picking_focus() or is_picking_close()) and buffer.pick_letter .. " "
							or buffer.devicon.icon
					end,
					fg = function(buffer)
						return (is_picking_focus() and yellow) or (is_picking_close() and red) or buffer.devicon.color
					end,
					italic = function()
						return (is_picking_focus() or is_picking_close())
					end,
					bold = function()
						return (is_picking_focus() or is_picking_close())
					end,
				},
				{
					text = function(buffer)
						return buffer.unique_prefix
					end,
					fg = get_hex("Comment", "fg"),
					italic = true,
				},
				{
					text = function(buffer)
						return buffer.filename .. " "
					end,
					bold = function(buffer)
						return buffer.is_focused
					end,
					fg = function(buffer)
						local severity = vim.diagnostic.severity
						local function has(sev)
							return #vim.diagnostic.get(buffer.number, { severity = sev }) > 0
						end

						if has(severity.ERROR) then
							return red
						end
						if has(severity.WARN) then
							return yellow
						end
						if has(severity.INFO) or has(severity.HINT) then
							return blue
						end
						if buffer.is_focused then
							return green
						end
						return get_hex("Comment", "fg")
					end,
				},
				{
					text = function(buffer)
						local diagnostics = vim.diagnostic.get(buffer.number)
						local counts = { error = 0, warn = 0, info = 0, hint = 0 }

						for _, diagnostic in ipairs(diagnostics) do
							if diagnostic.severity == vim.diagnostic.severity.ERROR then
								counts.error = counts.error + 1
							elseif diagnostic.severity == vim.diagnostic.severity.WARN then
								counts.warn = counts.warn + 1
							elseif diagnostic.severity == vim.diagnostic.severity.INFO then
								counts.info = counts.info + 1
							elseif diagnostic.severity == vim.diagnostic.severity.HINT then
								counts.hint = counts.hint + 1
							end
						end

						local result = ""
						if counts.error > 0 then
							result = result .. " " .. counts.error .. " "
						end
						if counts.warn > 0 then
							result = result .. " " .. counts.warn .. " "
						end
						if counts.info > 0 then
							result = result .. " " .. counts.info .. " "
						end
						if counts.hint > 0 then
							result = result .. " " .. counts.hint .. " "
						end

						return result
					end,
					fg = function(buffer)
						local severity = vim.diagnostic.severity
						local function has(sev)
							return #vim.diagnostic.get(buffer.number, { severity = sev }) > 0
						end

						if has(severity.ERROR) then
							return red
						end
						if has(severity.WARN) then
							return yellow
						end
						if has(severity.INFO) or has(severity.HINT) then
							return blue
						end
						return get_hex("Comment", "fg")
					end,
				},
				{
					text = function(buffer)
						return buffer.is_modified and "●" or "󰖭"
					end,
					on_click = function(_, _, _, _, buffer)
						buffer:delete()
					end,
					fg = function(buffer)
						return buffer.is_modified and get_hex("Normal", "fg") or get_hex("Comment", "fg")
					end,
				},
				{
					text = " ",
				},
			},
			sidebar = {
				filetype = { "NvimTree", "neo-tree" },
				components = {
					{
						text = function(_)
							return "Trees"
						end,
						fg = yellow,
						bg = function()
							return get_hex("NvimTreeNormal", "bg")
						end,
						bold = true,
					},
				},
			},
		})
		local map = vim.keymap.set
		local opts = { noremap = true, silent = true }

		map("n", "<A-,>", "<Plug>(cokeline-focus-prev)", opts)
		map("n", "<A-.>", "<Plug>(cokeline-focus-next)", opts)
		map("n", "<A-<>", "<Plug>(cokeline-switch-prev)", opts)
		map("n", "<A->>", "<Plug>(cokeline-switch-next)", opts)
		map("n", "<A-1>", "<Plug>(cokeline-focus-1)", opts)
		map("n", "<A-2>", "<Plug>(cokeline-focus-2)", opts)
		map("n", "<A-3>", "<Plug>(cokeline-focus-3)", opts)
		map("n", "<A-4>", "<Plug>(cokeline-focus-4)", opts)
		map("n", "<A-5>", "<Plug>(cokeline-focus-5)", opts)
		map("n", "<A-6>", "<Plug>(cokeline-focus-6)", opts)
		map("n", "<A-7>", "<Plug>(cokeline-focus-7)", opts)
		map("n", "<A-8>", "<Plug>(cokeline-focus-8)", opts)
		map("n", "<A-9>", "<Plug>(cokeline-focus-9)", opts)
		map("n", "<A-0>", "<Plug>(cokeline-focus-10)", opts)
		map("n", "<A-c>", ":Bdelete<CR>", opts)
		map("n", "<C-p>", "<Plug>(cokeline-pick-focus)", opts)
	end,
}
