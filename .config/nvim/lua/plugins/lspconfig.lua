return {
	{
		"williamboman/mason-lspconfig.nvim",
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = {
					"lua_ls",
				},
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
			local lspconfig = require("lspconfig")

			local capabilities = vim.lsp.protocol.make_client_capabilities()
			capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

			lspconfig.lua_ls.setup({
				capabilities = capabilities,
			})

			vim.lsp.config('intelephense', {
				capabilities = capabilities,
				settings = {
					intelephense = {
						files = {
							maxSize = 10000000,
						},
					}
				}
			})
			vim.lsp.enable('intelephense')

			vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "LSP Hover" })
			vim.keymap.set("n", "<C-p>", vim.lsp.buf.signature_help, { desc = "LSP signature help" })
			vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { desc = "Rename" })
			vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "Code Action" })
			vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, { desc = "Signature Documentation" })
			vim.keymap.set("i", "<C-p>", vim.lsp.buf.signature_help, { desc = "LSP Signature Help" })
		end,
	},
}
