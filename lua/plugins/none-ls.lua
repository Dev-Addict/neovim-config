return {
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
}
