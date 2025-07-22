vim.api.nvim_create_autocmd("FileType", {
	pattern = "*",
	callback = function(args)
		local ft = vim.bo[args.buf].filetype

		if ft == "dart" then
			vim.opt_local.shiftwidth = 2
			vim.opt_local.tabstop = 2
		else
			vim.opt_local.tabstop = 4
			vim.opt_local.shiftwidth = 4
		end
	end,
})

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
vim.opt.splitright = true

vim.filetype.add({
	extension = {
		["http"] = "http",
		["templ"] = "templ",
	},
})

vim.cmd([[
    augroup ejs_as_html
        autocmd!
        autocmd BufNewFile,BufRead *.ejs set filetype=html
    augroup END
]])

vim.cmd([[
    augroup local_env_as_sh
        autocmd!
        autocmd BufNewFile,BufRead .env* set filetype=sh
    augroup END
]])

vim.api.nvim_create_autocmd("FileType", {
	pattern = "json",
	callback = function(ev)
		print(ev)
		vim.bo[ev.buf].formatprg = "jq"
	end,
})

vim.filetype.add({
	pattern = {
		[".*%.blade%.php"] = "blade",
	},
})
