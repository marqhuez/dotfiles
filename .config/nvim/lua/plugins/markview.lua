return {
	"marqhuez/markview.nvim",
	lazy = false,
	config = function()
		require("markview").setup({
			markdown = { tables = { wrap = "virtual" } },
		})
	end,

	-- Completion for `blink.cmp`
	-- dependencies = { "saghen/blink.cmp" },
}
