return {
	"neovim/nvim-lspconfig",
	config = function()
		vim.lsp.enable("lua_ls")
		vim.lsp.enable("pyright")
		vim.lsp.enable("intelephense")
		vim.lsp.config("intelephense", {
			settings = {
				intelephense = {
					format = {
						enable = false,
					},
				},
			},
		})
		vim.lsp.enable("ts_ls")
		vim.lsp.enable("clangd")

		vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { desc = "Rename" })
		vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "Code Action" })
	end,
}
