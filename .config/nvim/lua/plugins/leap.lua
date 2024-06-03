return {
	"ggandor/leap.nvim",
	lazy = false,
	priority = 100,
	config = function()
		require("leap").add_default_mappings()
	end,
}
