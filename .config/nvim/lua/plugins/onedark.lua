return {
	"navarasu/onedark.nvim",
	priority = 1000, -- make sure to load this before all the other start plugins
	config = function()
		require("onedark").setup({
			style = "darker",
		})

		require("onedark").load()

		vim.api.nvim_set_hl(0, "NvimTreeRootFolder", { fg = "#A9B0B8" })
		vim.api.nvim_set_hl(0, "NvimTreeFolderIcon", { fg = "#4FA6ED" })
	end,
}
