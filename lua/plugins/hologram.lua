return {
  "edluffy/hologram.nvim",
  config = function()
    if not vim.g.neovide then
      require("hologram").setup({
        auto_display = true,
      })
    end
  end,
}
