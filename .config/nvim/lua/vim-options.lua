-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.api.nvim_create_autocmd("FileType", {
	pattern = "*",
	callback = function(args)
		local ft = vim.bo[args.buf].filetype

		if ft == "dart" then
			vim.opt.expandtab = true
			vim.opt_local.tabstop = 2
			vim.opt_local.shiftwidth = 2
		else
			vim.opt_local.tabstop = 4
			vim.opt_local.shiftwidth = 4
		end
	end,
})

-- optionally enable 24-bit colour
vim.opt.termguicolors = true

vim.opt.relativenumber = true
vim.opt.clipboard = "unnamedplus"
vim.opt.swapfile = false
vim.opt.scrolloff = 10
vim.opt.fixendofline = true

vim.wo.number = true
vim.o.hlsearch = false

vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.wo.signcolumn = "yes"

vim.cmd("cnorea W w")
vim.cmd("cnorea Wa wa")

vim.cmd("cnorea Q q")
vim.cmd("cnorea Qa qa")

vim.cmd("cnorea Wqa wqa")

vim.opt.fillchars:append({ eob = " " })

vim.o.updatetime = 300 -- faster hover trigger
vim.api.nvim_create_autocmd("CursorHold", {
	callback = function()
		vim.diagnostic.open_float(nil, {
			focusable = false,
			close_events = { "BufLeave", "CursorMoved", "InsertEnter", "FocusLost" },
			border = "rounded",
			source = "always",
			prefix = "",
			scope = "cursor",
		})
	end,
})
