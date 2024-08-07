return {
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.6",
		dependencies = { "nvim-lua/plenary.nvim", "debugloop/telescope-undo.nvim" },
		config = function()
			local conf = require("telescope.config").values
			local builtin = require("telescope.builtin")

			vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Find Files" })
			vim.keymap.set("n", "<leader>fw", builtin.live_grep, {
				vimgrep_arguments = table.insert(conf.vimgrep_arguments, "--fixed-strings"),
				desc = "Find Word",
			})
			vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Find Buffer" })
			vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Find Help" })

			vim.keymap.set("n", "gd", builtin.lsp_definitions, { desc = "Goto Definition" })
			vim.keymap.set("n", "gr", builtin.lsp_references, { desc = "Goto References" })
			vim.keymap.set("n", "gi", builtin.lsp_implementations, { desc = "Goto Implementation" })

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
			})
			require("telescope").load_extension("ui-select")
		end,
	},
}
