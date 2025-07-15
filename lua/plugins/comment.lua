return {
  {
    "numToStr/Comment.nvim",
    opts = {},
  },
  {
    "danymat/neogen",
    config = function()
      require("neogen").setup({})

      local opts = { noremap = true, silent = true }

      vim.api.nvim_set_keymap("n", "gn", ":lua require('neogen').generate()<CR>", opts)
    end,
  },
  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {},
  },
}
