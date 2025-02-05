return {
	"nvim-neotest/neotest",
	dependencies = {
		"nvim-neotest/nvim-nio",
		"nvim-lua/plenary.nvim",
		"antoinemadec/FixCursorHold.nvim",
		"nvim-treesitter/nvim-treesitter",
		"V13Axel/neotest-pest",
	},
	config = function()
		require("neotest").setup({
			adapters = {
				require("neotest-pest"),
			},
		})

		vim.keymap.set("n", "<leader>tn", function()
			require("neotest").run.run()
		end)
	end,
}
