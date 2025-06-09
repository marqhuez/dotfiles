return {
	{
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-path",
		"hrsh7th/cmp-cmdline",
	},
	{
		"L3MON4D3/LuaSnip",
		dependencies = {
			"saadparwaiz1/cmp_luasnip",
			"rafamadriz/friendly-snippets",
		},
	},
	{
		"hrsh7th/nvim-cmp",
		config = function()
			local cmp = require("cmp")
			local luasnip = require("luasnip")

			require("luasnip.loaders.from_lua").load({ paths = "~/.config/nvim/lua/snippets" })

			vim.keymap.set({ "i", "s" }, "<Tab>", function()
				luasnip.jump(1)
			end, { silent = true })
			vim.keymap.set({ "i", "s" }, "<S-Tab>", function()
				luasnip.jump(-1)
			end, { silent = true })

			require("luasnip.loaders.from_vscode").lazy_load()

			luasnip.filetype_extend("templ", { "html" })
			luasnip.filetype_extend("blade", { "html" })
			luasnip.filetype_extend("typescriptreact", { "html" })

			cmp.setup({
				snippet = {
					expand = function(args)
						luasnip.lsp_expand(args.body)
					end,
				},
				window = {
					completion = cmp.config.window.bordered(),
					documentation = cmp.config.window.bordered(),
				},
				mapping = cmp.mapping.preset.insert({
					["<C-b>"] = cmp.mapping.scroll_docs(-4),
					["<C-f>"] = cmp.mapping.scroll_docs(4),
					["<C-Space>"] = cmp.mapping.complete(),
					["<C-e>"] = cmp.mapping.abort(),
					["<CR>"] = cmp.mapping.confirm({ select = true }),
				}),
				sources = cmp.config.sources({
					{ name = "nvim_lsp" },
					{ name = "luasnip" },
				}, {
					{ name = "buffer" },
				}),
				sorting = {
					priority_weight = 2,
					comparators = {
						-- 👇 Custom comparator for specific snippet name
						function(entry1, entry2)
							local target_label = "dd"
							local snippet_kind = cmp.lsp.CompletionItemKind.Snippet

							local is_snippet1 = entry1:get_kind() == snippet_kind
							local is_snippet2 = entry2:get_kind() == snippet_kind

							local label1 = entry1.completion_item.label
							local label2 = entry2.completion_item.label

							local is_target1 = is_snippet1 and label1 == target_label
							local is_target2 = is_snippet2 and label2 == target_label

							if is_target1 and not is_target2 then
								return true
							elseif is_target2 and not is_target1 then
								return false
							end
						end,
						cmp.config.compare.offset,
						cmp.config.compare.exact,
						cmp.config.compare.score,
						cmp.config.compare.recently_used,
						cmp.config.compare.kind,
						cmp.config.compare.sort_text,
						cmp.config.compare.length,
						cmp.config.compare.order,
					},
				},
			})
		end,
	},
}
