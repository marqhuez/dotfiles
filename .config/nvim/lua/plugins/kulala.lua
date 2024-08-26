return {
	"mistweaverco/kulala.nvim",
	opts = {},
	init = function()
		local kulala = require("kulala")

		vim.keymap.set("n", "<leader>rr", kulala.run, { desc = "Run HTTP request" })
		vim.keymap.set("n", "<leader>ra", kulala.run_all, { desc = "Run all HTTP request in current file" })
		vim.keymap.set("n", "<leader>rl", kulala.replay, { desc = "Run last HTTP request" })
		vim.keymap.set("n", "<leader>rt", kulala.toggle_view, { desc = "Toggle betwee HTTP response and headers" })
	end,
}

-- return {
-- 	"rest-nvim/rest.nvim",
-- 	config = function()
-- 		vim.keymap.set("n", "<leader>rr", ":Rest run<CR>", { desc = "Run HTTP request under cursor" })
-- 		vim.keymap.set("n", "<leader>rl", ":Rest last<CR>", { desc = "Run last HTTP request" })
-- 	end
-- }
