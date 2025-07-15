return {
  "gnikdroy/projections.nvim",
  branch = "pre_release",
  config = function()
    require("projections").setup({
      workspaces = {
        "~/Projects",
        "~/Work",
      },
      store_hooks = {
        pre = function()
          -- nvim-tree
          local nvim_tree_present, api = pcall(require, "nvim-tree.api")
          if nvim_tree_present then
            api.tree.close()
          end

          -- neo-tree
          if pcall(require, "neo-tree") then
            vim.cmd([[Neotree action=close]])
          end
        end,
      },
    })

    require("telescope").load_extension("projections")
    vim.keymap.set("n", "<leader>fp", function()
      vim.cmd("Telescope projections")
    end)
  end,
}
