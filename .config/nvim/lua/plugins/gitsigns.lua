return {
	"lewis6991/gitsigns.nvim",
	config = function()
		require("gitsigns").setup()

		vim.keymap.set("n", "<leader>gb", function()
			vim.cmd("Gitsigns blame")
		end, { desc = "Git blame" })

		vim.keymap.set("n", "<leader>gtb", function()
			vim.cmd("Gitsigns toggle_current_line_blame")
		end, { desc = "Toggle git blame under cursor" })
	end,
}
