return {
  {
    "karb94/neoscroll.nvim",
    config = function()
      require("neoscroll").setup({})
    end,
  },
  {
    "petertriho/nvim-scrollbar",
    dependencies = {
      {
        "kevinhwang91/nvim-hlslens",
        config = function()
          require("hlslens").setup({
            build_position_cb = function(plist, _, _, _)
              require("scrollbar.handlers.search").handler.show(plist.start_pos)
            end,
          })

          vim.cmd([[
        augroup scrollbar_search_hide
            autocmd!
            autocmd CmdlineLeave : lua require('scrollbar.handlers.search').handler.hide()
        augroup END
    ]])
        end,
      },
    },
    config = function()
      require("scrollbar").setup()
    end,
  },
  {
    "gorbit99/codewindow.nvim",
    config = function()
      local codewindow = require("codewindow")
      codewindow.setup({
        auto_enable = true,
      })

      vim.keymap.set("n", "<leader>oo", codewindow.toggle_minimap, {})
      vim.keymap.set("n", "<leader>of", codewindow.toggle_focus, {})
    end,
  },
}
