return {
	"rest-nvim/rest.nvim",
	config = function()
		vim.keymap.set("n", "<leader>rr", ":Rest run<CR>", { desc = "Run HTTP request under cursor" })
		vim.keymap.set("n", "<leader>rl", ":Rest last<CR>", { desc = "Run last HTTP request" })
	end
}
