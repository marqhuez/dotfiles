return {
	"d3jn/php-auto-namespacer.vim",
	config = function()
		vim.g.php_auto_namespacer_map = {
			["/home/marqhuez/codebase/ms-sr-partner-dashboard/src"] = "App\\",
			["/home/marqhuez/projects/laravel/test-app/app"] = "App\\",
			["/home/marqhuez/codebase/ms-payment-gateway/src"] = "App\\",
			["/home/marqhuez/projects/ab-test-laravel/app"] = "App\\",
			["/home/marqhuez/projects/ab-test-v2/app"] = "App\\",
		}
	end,
}
