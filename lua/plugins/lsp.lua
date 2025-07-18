return {
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup()
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = {
					"bashls",
					"clangd",
					"css_variables",
					"cssls",
					"cssmodules_ls",
					"dockerls",
					"eslint",
					"gopls",
					"graphql",
					"html",
					"hyprls",
					"jdtls",
					"jsonls",
					"lua_ls",
					"markdown_oxide",
					"somesass_ls",
					"sqlls",
					"ts_ls",
					"yamlls",
					"csharp_ls",
					"kotlin_language_server",
				},
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"b0o/schemastore.nvim",
		},
		config = function()
			local capabilities = require("cmp_nvim_lsp").default_capabilities()

			local lspconfig = require("lspconfig")

			local opts = { capabilities = capabilities }

			lspconfig.bashls.setup(opts)
			lspconfig.clangd.setup(opts)
			lspconfig.css_variables.setup(opts)
			lspconfig.cssls.setup(opts)
			lspconfig.cssmodules_ls.setup(opts)
			lspconfig.dockerls.setup(opts)
			lspconfig.eslint.setup(opts)
			lspconfig.gopls.setup(opts)
			lspconfig.graphql.setup(opts)
			lspconfig.html.setup(opts)
			lspconfig.hyprls.setup(opts)
			lspconfig.jsonls.setup({
				capabilities = capabilities,
				settings = {
					json = {
						schemas = require("schemastore").json.schemas(),
						validate = { enable = true },
					},
				},
			})
			lspconfig.lua_ls.setup(opts)
			lspconfig.markdown_oxide.setup(opts)
			lspconfig.somesass_ls.setup(opts)
			lspconfig.sqlls.setup(opts)
			lspconfig.ts_ls.setup(opts)
			lspconfig.yamlls.setup({
				capabilities = capabilities,
				settings = {
					yaml = {
						schemaStore = {
							-- You must disable built-in schemaStore support if you want to use
							-- this plugin and its advanced options like `ignore`.
							enable = false,
							-- Avoid TypeError: Cannot read properties of undefined (reading 'length')
							url = "",
						},
						schemas = require("schemastore").yaml.schemas(),
					},
				},
			})
			lspconfig.csharp_ls.setup(opts)
			lspconfig.jdtls.setup(opts)
			lspconfig.kotlin_language_server.setup(opts)
			lspconfig.qmlls.setup({
				capabilities = capabilities,
				cmd = { "qmlls6", "-E" },
			})

			vim.keymap.set("n", "gD", vim.lsp.buf.declaration, {})
			vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
			vim.keymap.set("n", "gi", vim.lsp.buf.implementation, {})
			vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, {})
			vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, {})
			vim.keymap.set("n", "<leader>wa", vim.lsp.buf.add_workspace_folder, {})
			vim.keymap.set("n", "<leader>wr", vim.lsp.buf.remove_workspace_folder, {})
			vim.keymap.set("n", "<leader>wl", function()
				print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
			end, {})
			vim.keymap.set("n", "<leader>D", vim.lsp.buf.type_definition, {})
			vim.keymap.set("n", "<leader>f", function()
				vim.lsp.buf.format({ async = true })
			end, {})
		end,
	},
	{
		"jay-babu/mason-null-ls.nvim",
		event = { "BufReadPre", "BufNewFile" },
		dependencies = {
			"williamboman/mason.nvim",
			"nvimtools/none-ls.nvim",
		},
		config = function()
			require("mason-null-ls").setup({
				automatic_installation = true,
				ensure_installed = {
					"checkmake",
					"checkstyle",
					"clang-format",
					"eslint_d",
					"gersemi",
					"goimports-reviser",
					"golangci-lint",
					"google-java-format",
					"hadolint",
					"markdownlint",
					"prettier",
					"shfmt",
					"sqlfluff",
					"stylua",
					"ktlint",
					"codelldb",
				},
			})
		end,
	},
	{
		"ray-x/lsp_signature.nvim",
		event = "InsertEnter",
		opts = {},
	},
	{
		"linrongbin16/lsp-progress.nvim",
		config = function()
			require("lsp-progress").setup({
				client_format = function(client_name, spinner, series_messages)
					if #series_messages == 0 then
						return nil
					end
					return {
						name = client_name,
						body = spinner .. " " .. table.concat(series_messages, ", "),
					}
				end,
				format = function(client_messages)
					--- @param name string
					--- @param msg string?
					--- @return string
					local function stringify(name, msg)
						return msg and string.format("%s %s", name, msg) or name
					end

					local sign = ""
					local lsp_clients = vim.lsp.get_active_clients()
					local messages_map = {}
					for _, climsg in ipairs(client_messages) do
						messages_map[climsg.name] = climsg.body
					end

					if #lsp_clients > 0 then
						table.sort(lsp_clients, function(a, b)
							return a.name < b.name
						end)
						local builder = {}
						for _, cli in ipairs(lsp_clients) do
							if type(cli) == "table" and type(cli.name) == "string" and string.len(cli.name) > 0 then
								if messages_map[cli.name] then
									table.insert(builder, stringify(cli.name, messages_map[cli.name]))
								else
									table.insert(builder, stringify(cli.name))
								end
							end
						end
						if #builder > 0 then
							return sign .. " " .. table.concat(builder, ", ")
						end
					end
					return ""
				end,
			})
		end,
	},
	{
		"sontungexpt/better-diagnostic-virtual-text",
		event = "LspAttach",
		config = function()
			require("better-diagnostic-virtual-text").setup({})
		end,
	},
	{
		"mawkler/refjump.nvim",
		event = "LspAttach",
		opts = {},
	},
	{
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
	},
	{
		"nvimtools/none-ls.nvim",
		config = function()
			local null_ls = require("null-ls")

			null_ls.setup({
				sources = {
					null_ls.builtins.code_actions.gitsigns,
					null_ls.builtins.code_actions.refactoring,
					null_ls.builtins.diagnostics.checkmake,
					null_ls.builtins.diagnostics.checkstyle.with({
						extra_args = { "-c", "/google_checks.xml" },
					}),
					null_ls.builtins.diagnostics.dotenv_linter,
					require("none-ls.diagnostics.eslint_d"),
					null_ls.builtins.diagnostics.golangci_lint,
					null_ls.builtins.diagnostics.hadolint,
					null_ls.builtins.diagnostics.ktlint,
					null_ls.builtins.diagnostics.markdownlint,
					null_ls.builtins.diagnostics.spectral,
					null_ls.builtins.diagnostics.sqlfluff,
					null_ls.builtins.diagnostics.tidy,
					null_ls.builtins.diagnostics.todo_comments,
					null_ls.builtins.formatting.clang_format,
					null_ls.builtins.formatting.csharpier,
					null_ls.builtins.formatting.gersemi,
					null_ls.builtins.formatting.gofmt,
					null_ls.builtins.formatting.goimports,
					null_ls.builtins.formatting.goimports_reviser,
					null_ls.builtins.formatting.google_java_format,
					null_ls.builtins.formatting.ktlint,
					null_ls.builtins.formatting.markdownlint,
					null_ls.builtins.formatting.prettier,
					null_ls.builtins.formatting.shfmt,
					null_ls.builtins.formatting.sqlfluff,
					null_ls.builtins.formatting.stylua,
					null_ls.builtins.formatting.tidy,
					null_ls.builtins.hover.dictionary,
				},
			})
		end,
		dependencies = {
			"nvimtools/none-ls-extras.nvim",
		},
	},
}
