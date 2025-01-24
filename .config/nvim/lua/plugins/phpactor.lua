return {
	"phpactor/phpactor",
	build = "composer install",
	config = function()
		vim.keymap.set("n", "<leader>pm", ":PhpactorContextMenu<CR>", {})
		vim.keymap.set("n", "<leader>pc", ":PhpactorClassNew<CR>", {})
	end,
}
