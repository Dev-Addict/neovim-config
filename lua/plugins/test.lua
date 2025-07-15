return {
	"nvim-neotest/neotest",
	dependencies = {
		"nvim-neotest/nvim-nio",
		"nvim-lua/plenary.nvim",
		"antoinemadec/FixCursorHold.nvim",
		"nvim-treesitter/nvim-treesitter",
    "nvim-neotest/neotest-python",
    "nvim-neotest/neotest-plenary",
    "nvim-neotest/neotest-go",
    "nvim-neotest/neotest-jest",
    "thenbe/neotest-playwright",
    "Issafalcon/neotest-dotnet",
    "MarkEmmons/neotest-deno",
    "rcasia/neotest-java",
    "alfaix/neotest-gtest",
    "nvim-neotest/neotest-vim-test",
	},
	config = function()
		require("neotest").setup({
			adapters = {
				require("neotest-python"),
				require("neotest-plenary"),
				require("neotest-go"),
				require("neotest-jest"),
				require("neotest-playwright"),
				require("neotest-dotnet"),
				require("neotest-deno"),
				require("neotest-java"),
				require("neotest-gtest"),
				require("neotest-vim-test"),
			},
		})
	end,
}
