return {
	"gbprod/cutlass.nvim",
	config = function()
		vim.keymap.set("n", "x", "d", { desc = "Cut" })
		vim.keymap.set("x", "x", "d", { desc = "Cut" })
		vim.keymap.set("n", "xx", "dd", { desc = "Cut" })
		vim.keymap.set("n", "X", "D", { desc = "Cut" })
		vim.keymap.set("v", "x", "d", { desc = "Cut" })

		require("cutlass").setup({
			exclude = { "ns", "nS", "vs", "vS" },
		})
	end,
}
