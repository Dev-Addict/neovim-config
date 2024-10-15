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
          "rust_analyzer"
				},
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
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
			lspconfig.jsonls.setup(opts)
			lspconfig.lua_ls.setup(opts)
			lspconfig.markdown_oxide.setup(opts)
			lspconfig.somesass_ls.setup(opts)
			lspconfig.sqlls.setup(opts)
			lspconfig.ts_ls.setup(opts)
			lspconfig.yamlls.setup(opts)
			lspconfig.csharp_ls.setup(opts)
			lspconfig.jdtls.setup(opts)
			lspconfig.kotlin_language_server.setup(opts)
      lspconfig.rust_analyzer.setup(opts)

			vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
			vim.keymap.set("n", "gD", vim.lsp.buf.declaration, {})
			vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
			vim.keymap.set("n", "gi", vim.lsp.buf.implementation, {})
			vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, {})
			vim.keymap.set("n", "<leader>wa", vim.lsp.buf.add_workspace_folder, {})
			vim.keymap.set("n", "<leader>wr", vim.lsp.buf.remove_workspace_folder, {})
			vim.keymap.set("n", "<leader>wl", function()
				print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
			end, {})
			vim.keymap.set("n", "<leader>D", vim.lsp.buf.type_definition, {})
			vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, {})
			vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, {})
			vim.keymap.set("n", "gr", vim.lsp.buf.references, {})
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
}
