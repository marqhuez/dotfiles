return {
	"hrsh7th/cmp-nvim-lsp",
	"hrsh7th/cmp-buffer",
	"hrsh7th/cmp-path",
	"hrsh7th/cmp-cmdline",
	{
		"hrsh7th/nvim-cmp",
		config = function()
			local cmp = require("cmp")
			local luasnip = require("luasnip")

			cmp.setup({
				snippet = {
					expand = function(args)
						luasnip.lsp_expand(args.body)
					end,
				},
				mapping = cmp.mapping.preset.insert({
					["<M-Space>"] = cmp.mapping.complete(),
					["<CR>"] = cmp.mapping.confirm({ select = true }),
				}),
				sources = cmp.config.sources({
					{ name = "nvim_lsp" },
					{ name = "luasnip" },
				}, {
					{ name = "buffer" },
				}),
				window = {
					completion = cmp.config.window.bordered({
						border = "rounded",
						winhighlight = "Normal:CmpMenu,FloatBorder:CmpBorder,CursorLine:CmpSelection,Search:None",
					}),
					documentation = cmp.config.window.bordered({
						border = "rounded",
						winhighlight = "Normal:CmpDoc,FloatBorder:CmpDocBorder",
					}),
				},
				formatting = {
					fields = { "abbr", "kind", "menu" },
					format = function(entry, item)
						item.menu = ({
							nvim_lsp = "[LSP]",
							buffer = "[Buf]",
							path = "[Path]",
							luasnip = "[Snip]",
						})[entry.source.name]
						return item
					end,
				},
			})

			vim.api.nvim_set_hl(0, "CmpSelection", { bg = "#30363F" })
		end,
	},
}
