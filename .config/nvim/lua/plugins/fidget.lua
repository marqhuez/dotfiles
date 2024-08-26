return {
	'j-hui/fidget.nvim',
	config = function()
		require('fidget').setup({
			window = { winblend = 0, blend = 0 }
		})
	end,
	priority = 3000
}
