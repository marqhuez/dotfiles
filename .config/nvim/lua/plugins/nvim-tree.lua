return {
	"nvim-tree/nvim-tree.lua",
	version = "*",
	lazy = false,
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	config = function()
		require("nvim-tree").setup({
			git = {
				ignore = false,
			},
			filters = {
				custom = { ".DS_Store" },
			},
			update_focused_file = {
				enable = false,
				update_root = false,
				ignore_list = {},
				exclude = function(tbl)
					return string.match(tbl.match, "vendor") or string.match(tbl.match, "node_modules")
				end,
			},
		})

		vim.keymap.set("n", "<C-n>", ":NvimTreeToggle<CR>", {})
		vim.keymap.set("n", "<leader>tf", ":NvimTreeFindFile<CR>", { desc = "Find current file in tree" })

		vim.cmd("NvimTreeOpen")
		vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<c-w>l", true, true, true), "n", true)
	end,
}
