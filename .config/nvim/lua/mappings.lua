vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "Jump left" })
vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "Jump right" })
vim.keymap.set("n", "<C-j>", "<C-w>k", { desc = "Jump up" })
vim.keymap.set("n", "<C-k>", "<C-w>j", { desc = "Jump down" })

vim.keymap.set("n", "j", "k", { desc = "Up" })
vim.keymap.set("n", "k", "j", { desc = "Down" })

vim.keymap.set("v", "j", "k", { desc = "Up" })
vim.keymap.set("v", "k", "j", { desc = "Down" })

vim.keymap.set("o", "j", "k", { desc = "Up" })
vim.keymap.set("o", "k", "j", { desc = "Down" })

vim.keymap.set("n", "í", '"_dl', { desc = "Delete char" })
vim.keymap.set("v", "p", '"_dP', {})

vim.keymap.set("n", "<leader>x", ":q<CR>", { desc = "Close buffer" })

vim.keymap.set("v", "J", ":m '<-2<CR>gv=gv", {})
vim.keymap.set("v", "K", ":m '>+1<CR>gv=gv", {})

vim.keymap.set("i", "<C-h>", "<Left>", { desc = "Move left" })
vim.keymap.set("i", "<C-j>", "<Up>", { desc = "Move up" })
vim.keymap.set("i", "<C-k>", "<Down>", { desc = "Move down" })
vim.keymap.set("i", "<C-l>", "<Right>", { desc = "Move right" })

vim.keymap.set("i", "<C-e>", "<C-o>e<C-o>l", { desc = "Jump a word" })
vim.keymap.set("i", "<C-b>", "<C-o>b<C-o>h", { desc = "Jump a word" })

vim.keymap.set("v", "v", "<Esc>", { desc = "Exit visual mode" })

vim.keymap.set("i", "jk", "<Esc>", { desc = "Exit insert mode" })
vim.keymap.set("i", "kj", "<Esc>", { desc = "Exit insert mode" })

vim.keymap.set("i", "<A-d>", "<C-o>yy<C-o>p", { desc = "Duplicate line" })
vim.keymap.set("n", "<A-d>", "yyp", { desc = "Duplicate line" })

vim.keymap.set("n", "<C-d>", "<C-d>zz", {})
vim.keymap.set("n", "<C-u>", "<C-u>zz", {})

vim.keymap.set("n", "<leader>fd", function()
	vim.diagnostic.open_float({ border = "rounded" })
end, { desc = "Floating diagnostic" })
vim.keymap.set("n", "<leader>q", function()
	vim.diagnostic.setloclist()
end, { desc = "Diagnostic setloclist" })

vim.keymap.set("n", "<leader>lr", ":LspRestart<CR>", {desc = "Restart LSP Server"})
