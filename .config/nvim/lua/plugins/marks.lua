return {
	"chentoast/marks.nvim",
	event = "VeryLazy",
	config = function()
		require("marks").setup({
			mappings = {
				toggle = "<leader>m",
				next = "<leader>mn",
				prev = "<leader>mp",
				set = false,
			},
		})
	end,
}
