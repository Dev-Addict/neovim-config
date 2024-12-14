return {
	{
		"mfussenegger/nvim-dap",
		dependencies = {
			"nvim-neotest/nvim-nio",
			"rcarriga/nvim-dap-ui",
			"leoluz/nvim-dap-go",
		},
		config = function()
			local dap, dapui = require("dap"), require("dapui")
			local dapgo = require("dapgo")

			dapui.setup()
			dapgo.setup()

			dap.listeners.before.attach.dapui_config = function()
				dapui.open()
			end
			dap.listeners.before.launch.dapui_config = function()
				dapui.open()
			end

			dap.listeners.before.event_terminated.dapui_config = function()
				dapui.close()
			end
			dap.listeners.before.event_exited.dapui_config = function()
				dapui.close()
			end

      vim.fn.sign_define('DapBreakpoint',{ text ='🟥', texthl ='', linehl ='', numhl =''})
vim.fn.sign_define('DapStopped',{ text ='▶️', texthl ='', linehl ='', numhl =''})

			vim.keymap.set("n", "<F5>", function()
				require("dap").continue()
			end, {})
			vim.keymap.set("n", "<F10>", function()
				require("dap").step_over()
			end, {})
			vim.keymap.set("n", "<F11>", function()
				require("dap").step_into()
			end, {})
			vim.keymap.set("n", "<F12>", function()
				require("dap").step_out()
			end, {})
      vim.keymap.set('n', '<leader>b', require 'dap'.toggle_breakpoint)

			vim.keymap.set("n", "<Leader>lp", function()
				require("dap").set_breakpoint(nil, nil, vim.fn.input("Log point message: "))
			end, {})
			vim.keymap.set("n", "<Leader>dr", function()
				require("dap").repl.open()
			end, {})
			vim.keymap.set("n", "<Leader>dl", function()
				require("dap").run_last()
			end, {})

			vim.keymap.set("n", "<Leader>w", function()
				dapui.open()
			end, {})
			vim.keymap.set("n", "<Leader>W", function()
				dapui.close()
			end, {})
		end,
	},
}
