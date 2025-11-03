return {
	"ggandor/leap.nvim",
	lazy = false,
	priority = 4100,
	config = function()
		vim.keymap.set("n", "s", "<Plug>(leap-forward)", { desc = "Leap forward" })
		vim.keymap.set("n", "S", "<Plug>(leap-backward)", { desc = "Leap backward" })
	end,
}
