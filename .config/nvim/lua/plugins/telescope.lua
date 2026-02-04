return {
	"nvim-telescope/telescope.nvim",
	version = "*",
	dependencies = {
		"nvim-lua/plenary.nvim",
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
	},
	config = function()
		require("telescope").setup({
			defaults = {
				path_display = {
					filename_first = {
						reverse_directories = true,
					},
				},
			},
		})

		local builtin = require("telescope.builtin")
		vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Telescope find files" })
		vim.keymap.set("n", "<leader>fw", function()
			local api = require("nvim-tree.api")
			local isValidForGrepping = api.tree.is_tree_buf() and api.tree.get_node_under_cursor().type == "directory"

			local options = {
				additional_args = function()
					return { "--fixed-strings" }
				end,
			}

			if isValidForGrepping then
				local selectedNodePath = api.tree.get_node_under_cursor().absolute_path
				options.search_dirs = { selectedNodePath }
			end

			builtin.live_grep(options)
		end, {
			desc = "Telescope live grep",
		})
		vim.keymap.set(
			"n",
			"<leader>fi",
			builtin.current_buffer_fuzzy_find,
			{ desc = "Telescope fuzzy find in current buffer" }
		)
		vim.keymap.set("n", "gd", builtin.lsp_definitions, { desc = "Goto definition (Telescope)" })
		vim.keymap.set("n", "gr", builtin.lsp_references, { desc = "Goto references (Telescope)" })
		vim.keymap.set("n", "gi", builtin.lsp_implementations, { desc = "Goto implementations (Telescope)" })

		local borderColor = "#535965"
		vim.api.nvim_set_hl(0, "TelescopeBorder", { fg = borderColor })
		vim.api.nvim_set_hl(0, "TelescopePromptBorder", { fg = borderColor })
		vim.api.nvim_set_hl(0, "TelescopeResultsBorder", { fg = borderColor })
		vim.api.nvim_set_hl(0, "TelescopePreviewBorder", { fg = borderColor })

		local selectionColor = "#E55561"
		vim.api.nvim_set_hl(0, "TelescopeMatching", {
			fg = selectionColor,
			bold = true,
		})
		vim.api.nvim_set_hl(0, "TelescopePromptPrefix", {
			fg = selectionColor,
		})
		vim.api.nvim_set_hl(0, "TelescopeSelectionCaret", {
			fg = selectionColor,
			bg = "#30363F",
		})
	end,
}
