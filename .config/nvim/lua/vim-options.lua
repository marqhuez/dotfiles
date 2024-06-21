vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.relativenumber = true
vim.opt.clipboard = "unnamedplus"
vim.opt.swapfile = false
vim.opt.scrolloff = 10

vim.wo.number = true
vim.o.hlsearch = false

vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.wo.signcolumn = "yes"

vim.filetype.add({ extension = { templ = "templ" } })

vim.cmd("cnorea W w")
vim.cmd("cnorea Wa wa")

vim.cmd("cnorea Q q")
vim.cmd("cnorea Qa qa")

vim.opt.fillchars:append({ eob = " " })
