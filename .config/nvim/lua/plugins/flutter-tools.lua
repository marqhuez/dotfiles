return {
	"marqhuez/flutter-tools.nvim",
	priority = 4000,
	lazy = false,
	dependencies = {
		"nvim-lua/plenary.nvim",
		"stevearc/dressing.nvim",
	},
	config = function()
		require("flutter-tools").setup({
			flutter_path = "/Users/marqhuez/.fluttersdk/bin/flutter",
			dev_log = {
				append_to_file = true,
				log_file_path = "/Users/marqhuez/.flutter_dev_log_sync.txt",
			},
		}) -- use defaults
	end,
}
