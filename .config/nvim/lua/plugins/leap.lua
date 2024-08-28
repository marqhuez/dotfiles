return {
	"ggandor/leap.nvim",
	lazy = false,
	priority = 3100,
	config = function()
		require("leap").add_default_mappings()
	end,
}
