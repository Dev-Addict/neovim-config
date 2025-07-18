return {
  "nvimdev/dashboard-nvim",
  event = "VimEnter",
  config = function()
    require("dashboard").setup({
      theme = "doom",
      config = {
        header = {},
        center = {
          {
            icon = " ",
            icon_hl = "Title",
            desc = "Find File           ",
            desc_hl = "String",
            key = "b",
            keymap = "SPC f f",
            key_hl = "Number",
            key_format = " %s",
            action = "lua print(2)",
          },
          {
            icon = " ",
            desc = "Find Dotfiles",
            key = "f",
            keymap = "SPC f d",
            key_format = " %s",
            action = "lua print(3)",
          },
        },
        footer = {},
        vertical_center = false,
      },
      footer = {},
    })
  end,
  dependencies = { { "nvim-tree/nvim-web-devicons" } },
}
