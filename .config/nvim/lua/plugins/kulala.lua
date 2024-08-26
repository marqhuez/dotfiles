return {
	'mistweaverco/kulala.nvim',
	opts = {},
	init = function()
		vim.keymap.set("n", "<leader>rr", ":lua require('kulala').run()<CR>",
			{ desc = "Run HTTP request", silent = true })
	end
}
