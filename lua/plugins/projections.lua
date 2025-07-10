return {
  "gnikdroy/projections.nvim",
  branch = "pre_release",
  config = function()
    require("projections").setup({
      workspaces = {
        "~/Projects",
      },
    })

    require("telescope").load_extension("projections")
    vim.keymap.set("n", "<leader>fp", function()
      vim.cmd("Telescope projections")
    end)

    local Session = require("projections.session")
    vim.api.nvim_create_autocmd({ "VimLeavePre" }, {
      callback = function()
        Session.store(vim.loop.cwd())
      end,
    })

    vim.api.nvim_create_autocmd({ "VimEnter" }, {
      callback = function()
        if vim.fn.argc() ~= 0 then
          return
        end
        local session_info = Session.info(vim.loop.cwd())
        if session_info == nil then
          Session.restore_latest()
        else
          Session.restore(vim.loop.cwd())
        end
      end,
      desc = "Restore last session automatically",
    })

    vim.opt.sessionoptions:append("localoptions")
  end,
}
