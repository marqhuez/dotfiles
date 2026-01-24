return {
	"nvim-flutter/flutter-tools.nvim",
	priority = 4000,
	lazy = false,
	dependencies = {
		"nvim-lua/plenary.nvim",
		"stevearc/dressing.nvim",
	},
	config = function()
		require("flutter-tools").setup({
			flutter_path = "/Users/marqhuez/.fluttersdk/bin/flutter",
		}) -- use defaults
	end,
}
