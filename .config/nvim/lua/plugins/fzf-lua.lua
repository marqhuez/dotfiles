return {
	"ibhagwan/fzf-lua",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		local fzfLua = require("fzf-lua")

		fzfLua.setup({
			grep = {
				formatter = "path.filename_first",
				no_header = true,
			},
			files = {
				formatter = "path.filename_first",
				git_icons = false,
				prompt = "> ",
				no_header = true,
				cwd_header = false,
				cwd_prompt = false,
				winopts = {
					title = " Find Files ",
					title_pos = "center",
					title_flags = false,
				},
			},
			winopts = {
				backdrop = 100,
				preview = {
					horizontal = "right:50%",
					winopts = {
						number = false,
					},
				},
			},
			fzf_opts = {
				["--color"] = "info:#7e8189,pointer:#bb7cd7,prompt:#bb7cd7,bg+:#2a2c32,hl:#74ade9,hl+:#74ade9,gutter:#22252a",
				["--pointer"] = ">",
				["--layout"] = "default",
			},
		})

		vim.keymap.set("n", "<leader>ff", function()
			fzfLua.files()
		end, { desc = "Find Files" })

		vim.keymap.set("n", "<leader>flw", function()
			local api = require("nvim-tree.api")
			local isValidForGrepping = api.tree.is_tree_buf() and api.tree.get_node_under_cursor().type == "directory"

			local options
			if isValidForGrepping then
				local selectedNodeName = api.tree.get_node_under_cursor().name
				options = { search_dirs = { selectedNodeName } }
			else
				options = {}
			end

			fzfLua.live_grep()
			-- pickers.prettyGrepPicker({
			-- 	picker = "live_grep",
			-- 	options = options,
			-- 	vimgrep_arguments = table.insert(conf.vimgrep_arguments, "--fixed-strings"),
			-- })
		end, {
			desc = "Find Word",
		})
	end,
}

-- fzfLua.setup({
-- 	hls = {
-- 		normal = "Normal",
-- 		preview_normal = "Normal",
-- 		border = "Function",
-- 		preview_border = "Function",
-- 	},
-- 	winopts = {
-- 		height = 0.25,
-- 		width = 0.4,
-- 		row = 0.5,
-- 		preview = { hidden = "hidden" },
-- 		border = "rounded",
-- 		treesitter = { enabled = true },
-- 	},
-- 	fzf_opts = {
-- 		["--no-info"] = "",
-- 		["--info"] = "hidden",
-- 		["--padding"] = "13%,5%,13%,5%",
-- 		["--header"] = " ",
-- 		["--no-scrollbar"] = "",
-- 	},
-- 	files = {
-- 		formatter = "path.filename_first",
-- 		git_icons = false,
-- 		prompt = ":",
-- 		no_header = true,
-- 		cwd_header = false,
-- 		cwd_prompt = false,
-- 		winopts = {
-- 			title = " files 📑 ",
-- 			title_pos = "center",
-- 			title_flags = false,
-- 		},
-- 		actions = {
-- 			["ctrl-d"] = {
-- 				fn = function(...)
-- 					fzfLua.actions.file_vsplit(...)
-- 					vim.cmd("windo diffthis")
-- 					local switch = vim.api.nvim_replace_termcodes("<C-w>h", true, false, true)
-- 					vim.api.nvim_feedkeys(switch, "t", false)
-- 				end,
-- 				desc = "diff-file",
-- 			},
-- 		},
-- 	},
-- 	buffers = {
-- 		formatter = "path.filename_first",
-- 		prompt = ":",
-- 		no_header = true,
-- 		fzf_opts = { ["--delimiter"] = " ", ["--with-nth"] = "-1.." },
-- 		winopts = {
-- 			title = " buffers 📝 ",
-- 			title_pos = "center",
-- 		},
-- 	},
-- 	helptags = {
-- 		prompt = ":",
-- 		winopts = {
-- 			title = " help 💡 ",
-- 			title_pos = "center",
-- 			width = 0.8,
-- 			height = 0.6,
-- 			preview = {
-- 				hidden = "nohidden",
-- 				horizontal = "down:40%",
-- 			},
-- 		},
-- 	},
-- 	git = {
-- 		branches = {
-- 			prompt = ":",
-- 			cmd = "git branch -a --format='%(refname:short)'",
-- 			no_header = true,
-- 			winopts = {
-- 				title = " branches  ",
-- 				title_pos = "center",
-- 				preview = { hidden = "hidden" },
-- 			},
-- 			actions = {
-- 				["ctrl-d"] = {
-- 					fn = function(selected)
-- 						vim.cmd.DiffviewOpen({ args = { selected[1] } })
-- 					end,
-- 					desc = "diffview-git-branch",
-- 				},
-- 			},
-- 		},
-- 	},
-- 	lsp = {
-- 		symbols = {
-- 			cwd_only = true,
-- 			no_header = true,
-- 			-- regex_filter = function(item)
-- 			-- 	if require("utils").is_in_list(item.kind, symbols_exclude) then
-- 			-- 		return false
-- 			-- 	else
-- 			-- 		return true
-- 			-- 	end
-- 			-- end,
-- 			prompt = ":",
-- 			winopts = {
-- 				title = " symbols ✨ ",
-- 				title_pos = "center",
-- 				width = 0.8,
-- 				height = 0.6,
-- 				preview = {
-- 					hidden = "nohidden",
-- 					horizontal = "down:40%",
-- 					wrap = "wrap",
-- 				},
-- 			},
-- 			symbol_fmt = function(s)
-- 				return s .. ":"
-- 			end,
-- 			symbol_style = 2,
-- 			child_prefix = false,
-- 		},
-- 	},
-- 	autocmds = {
-- 		prompt = ":",
-- 		winopts = {
-- 			title = " autocommands ",
-- 			title_pos = "center",
-- 			width = 0.8,
-- 			height = 0.6,
-- 			preview = {
-- 				hidden = "nohidden",
-- 				layout = "horizontal",
-- 				horizontal = "down:40%",
-- 				wrap = "wrap",
-- 			},
-- 		},
-- 	},
-- 	keymaps = {
-- 		prompt = ":",
-- 		winopts = {
-- 			title = " keymaps ",
-- 			title_pos = "center",
-- 			width = 0.8,
-- 			height = 0.6,
-- 			preview = {
-- 				hidden = "nohidden",
-- 				layout = "horizontal",
-- 				horizontal = "down:40%",
-- 			},
-- 		},
-- 		actions = {
-- 			["default"] = {
-- 				fn = function(selected)
-- 					local lines = vim.split(selected[1], "│", {})
-- 					local mode, key = lines[1]:gsub("%s+", ""), lines[2]:gsub("%s+", "")
-- 					vim.cmd("verbose " .. mode .. "map " .. key)
-- 				end,
-- 				desc = "print-keymap-location",
-- 			},
-- 		},
-- 	},
-- 	highlights = {
-- 		prompt = ":",
-- 		winopts = {
-- 			title = " highlights 🎨 ",
-- 			title_pos = "center",
-- 			width = 0.8,
-- 			height = 0.6,
-- 			preview = {
-- 				hidden = "nohidden",
-- 				layout = "horizontal",
-- 				horizontal = "down:40%",
-- 				wrap = "wrap",
-- 			},
-- 		},
-- 	},
-- 	registers = {
-- 		prompt = "registers:",
-- 		filter = "%a",
-- 		winopts = {
-- 			title = " registers 🏷️ ",
-- 			title_pos = "center",
-- 			width = 0.8,
-- 		},
-- 	},
-- })
