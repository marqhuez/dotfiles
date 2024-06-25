return {
	{
		"williamboman/mason-lspconfig.nvim",
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = { "lua_ls", "tsserver" },
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			{
				"j-hui/fidget.nvim",
				branch = "legacy",
				config = function()
					require("fidget").setup({
						window = { blend = 0 },
					})
				end,
			},
		},
		config = function()
			local lspconfig = require("lspconfig")

			local capabilities = vim.lsp.protocol.make_client_capabilities()
			capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

			lspconfig.lua_ls.setup({
				capabilities = capabilities,
			})
			lspconfig.tsserver.setup({
				filetypes = {
					"javascript",
					"javascriptreact",
					"javascript.jsx",
					"typescript",
					"typescriptreact",
					"typescript.tsx",
					"vue",
				},
				capabilities = capabilities,
				on_attach = function(client, _)
					client.server_capabilities.documentFormattingProvider = false
					client.server_capabilities.documentRangeFormattingProvider = false
				end,
				init_options = {
					plugins = {
						{
							name = "@vue/typescript-plugin",
							location = "/home/marqhuez/.nvm/versions/node/v20.11.1/lib/node_modules/@vue/typescript-plugin",
							languages = { "typescript", "vue" },
						},
					},
				},
			})
			lspconfig.eslint.setup({
				capabilities = capabilities,
			})
			lspconfig.volar.setup({
				on_attach = function(client, _)
					client.server_capabilities.documentFormattingProvider = false
					client.server_capabilities.documentRangeFormattingProvider = false
				end,
				capabilities = capabilities,
			})
			lspconfig.intelephense.setup({
				on_attach = function(client, _)
					client.server_capabilities.documentFormattingProvider = false
					client.server_capabilities.documentRangeFormattingProvider = false
				end,
				capabilities = capabilities,
			})
			lspconfig.gopls.setup({
				filetypes = { "go", "templ" },
				settings = {
					gopls = {
						templateExtensions = { "templ" },
					},
				},
				capabilities = capabilities,
			})
			lspconfig.templ.setup({
				on_attach = function()
					local custom_format = function()
						if vim.bo.filetype == "templ" then
							local bufnr = vim.api.nvim_get_current_buf()
							local filename = vim.api.nvim_buf_get_name(bufnr)
							local cmd = "templ fmt " .. vim.fn.shellescape(filename)

							vim.fn.jobstart(cmd, {
								on_exit = function()
									if vim.api.nvim_get_current_buf() == bufnr then
										vim.cmd("e!")
									end
								end,
							})
						else
							vim.lsp.buf.format()
						end
					end

					vim.keymap.set("n", "<leader>fm", custom_format, { desc = "Format Templ File" })
				end,
				capabilities = capabilities,
			})
			lspconfig.html.setup({
				on_attach = function(client, _)
					client.server_capabilities.documentFormattingProvider = false
					client.server_capabilities.documentRangeFormattingProvider = false
				end,
				capabilities = capabilities,
				filetypes = { "html", "templ" },
			})
			lspconfig.htmx.setup({})
			lspconfig.tailwindcss.setup({
				capabilities = capabilities,
				filetypes = { "templ", "astro", "javascript", "typescript", "react" },
				init_options = { userLanguages = { templ = "html" } },
			})

			vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "LSP Hover" })
			vim.keymap.set("n", "<C-p>", vim.lsp.buf.signature_help, { desc = "LSP signature help" })
			vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { desc = "Rename" })
			vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "Code Action" })
			vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, { desc = "Signature Documentation" })
			vim.keymap.set("i", "<C-p>", vim.lsp.buf.signature_help, { desc = "LSP Signature Help" })
		end,
	},
}
