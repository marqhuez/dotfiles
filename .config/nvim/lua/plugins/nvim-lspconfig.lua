return {
	"neovim/nvim-lspconfig",
	config = function()
		vim.lsp.enable("lua_ls")
		vim.lsp.enable("pyright")

		vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { desc = "Rename" })
		vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "Code Action" })
	end,
}
