-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.softtabstop = 2
vim.opt.expandtab = true

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
