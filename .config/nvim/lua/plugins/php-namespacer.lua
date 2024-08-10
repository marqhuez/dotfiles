return {
	"d3jn/php-auto-namespacer.vim",
	config = function()
		vim.g.php_auto_namespacer_map = {
			["/home/marqhuez/codebase/ms-sr-partner-dashboard/src"] = "App\\",
			["/home/marqhuez/projects/laravel/test-app/app"] = "App\\",
		}
	end,
}
