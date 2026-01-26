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
				custom = { ".DS_Store", "**.g.dart", "**.freezed.dart" },
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

		local bgColor = "#1b1e24"
		vim.api.nvim_set_hl(0, "NvimTreeNormal", { bg = bgColor })
		vim.api.nvim_set_hl(0, "NvimTreeNormalNC", { bg = bgColor })
		vim.api.nvim_set_hl(0, "NvimTreeEndOfBuffer", { bg = bgColor })

		local api = require("nvim-tree.api")
		local Event = api.events.Event

		local prev = { new_name = "", old_name = "" } -- Prevents duplicate events
		api.events.subscribe(Event.NodeRenamed, function(data)
			if prev.new_name ~= data.new_name or prev.old_name ~= data.old_name then
				data = data
				Snacks.rename.on_rename_file(data.old_name, data.new_name)
			end
		end)
	end,
}
