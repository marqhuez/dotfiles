return {
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.6",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"debugloop/telescope-undo.nvim",
		},
		config = function()
			local builtin = require("telescope.builtin")
			local pickers = require("user.telescope-pickers")
			local conf = require("telescope.config").values

			vim.keymap.set("n", "<leader>fm", function()
				vim.ui.input({ prompt = "File name mask: " }, function(input)
					pickers.prettyGrepPicker({
						picker = "live_grep",
						options = { hidden = true, no_ignore = true, glob_pattern = input },
					})
				end, { desc = "Find Files with mask" })
			end)

			-- vim.keymap.set("n", "<leader>ff", function()
			-- 	pickers.prettyFilesPicker({ picker = "find_files", options = { hidden = true, no_ignore = true } })
			-- end, { desc = "Find Files" })

			vim.keymap.set("n", "<leader>fw", function()
				local api = require("nvim-tree.api")
				local isValidForGrepping = api.tree.is_tree_buf()
					and api.tree.get_node_under_cursor().type == "directory"

				local options
				if isValidForGrepping then
					local selectedNodeName = api.tree.get_node_under_cursor().name
					options = { search_dirs = { selectedNodeName } }
				else
					options = {}
				end

				pickers.prettyGrepPicker({
					picker = "live_grep",
					options = options,
					vimgrep_arguments = table.insert(conf.vimgrep_arguments, "--fixed-strings"),
				})
			end, {
				desc = "Find Word",
			})

			vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Find Buffer" })
			vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Find Help" })
			vim.keymap.set("n", "<leader>fs", builtin.lsp_document_symbols, { desc = "Find Symbols" })

			vim.keymap.set("n", "gd", function()
				pickers.prettyLspActions({ picker = "lsp_definitions" })
			end, { desc = "Goto Definition" })
			vim.keymap.set("n", "gr", function()
				pickers.prettyLspActions({ picker = "lsp_references" })
			end, { desc = "Goto References" })
			vim.keymap.set("n", "gi", function()
				pickers.prettyLspActions({ picker = "lsp_implementations" })
			end, { desc = "Goto Implementation" })

			vim.keymap.set("n", "<leader>fi", function()
				builtin.current_buffer_fuzzy_find()
			end, { desc = "Fuzzily search in current buffer" })

			-- vim.keymap.set("n", "<leader>fj", function()
			-- 	local word = vim.fn.expand("<cword>")
			-- 	builtin.current_buffer_fuzzy_find({ search = word })
			-- end, { desc = "Find word under cursor in current buffer" })
			--
			-- vim.keymap.set("n", "<leader>fJ", function()
			-- 	local word = vim.fn.expand("<cWORD>")
			-- 	builtin.current_buffer_fuzzy_find({ term = word })
			-- end, { desc = "Find word under cursor in current buffer" })

			vim.keymap.set("n", "<leader>fk", function()
				local word = vim.fn.expand("<cword>")
				builtin.grep_string({ search = word })
			end, { desc = "Find word under cursor" })

			vim.keymap.set("n", "<leader>fK", function()
				local word = vim.fn.expand("<cWORD>")
				local escaped_word = word:gsub("([%(%)%.%%%+%-%*%?%[%^%$%(%)]%)", "%%%1")

				builtin.grep_string({ search = escaped_word })
			end, { desc = "Find word under cursor" })

			require("telescope").load_extension("undo")
			vim.keymap.set("n", "<leader>u", "<cmd>Telescope undo<cr>")

			vim.keymap.set("n", "<leader>pd", function()
				builtin.diagnostics()
			end, { desc = "Project wide diagnostics" })
		end,
	},
	{
		"nvim-telescope/telescope-ui-select.nvim",
		config = function()
			require("telescope").setup({
				extensions = {
					["ui-select"] = {
						require("telescope.themes").get_dropdown({}),
					},
				},
				defaults = {
					file_ignore_patterns = {
						"node_modules/",
						"vendor/",
						"cache/",
						".phpunit/",
						".idea/",
						".git/",
						"build/",
						"dist/",
					},
				},
			})
			require("telescope").load_extension("ui-select")
		end,
	},
}
