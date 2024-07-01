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
