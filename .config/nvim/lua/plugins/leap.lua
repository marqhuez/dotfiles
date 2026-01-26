return {
	"https://codeberg.org/andyg/leap.nvim",
	lazy = false,
	priority = 4100,
	config = function()
		require("leap").opts.vim_opts["go.ignorecase"] = true

		vim.keymap.set("n", "s", "<Plug>(leap-forward)", { desc = "Leap forward" })
		vim.keymap.set("n", "S", "<Plug>(leap-backward)", { desc = "Leap backward" })
	end,
}
