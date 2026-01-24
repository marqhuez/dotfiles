vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "Jump left" })
vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "Jump right" })
vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "Jump up" })
vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "Jump down" })

vim.keymap.set("n", "í", '"_dl', { desc = "Delete char" })
vim.keymap.set("v", "p", '"_dP', {})

vim.keymap.set("n", "<leader>x", ":q<CR>", { desc = "Close buffer" })

vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", {})
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", {})

vim.keymap.set("i", "<C-h>", "<Left>", { desc = "Move left" })
vim.keymap.set("i", "<C-k>", "<Up>", { desc = "Move up" })
vim.keymap.set("i", "<C-j>", "<Down>", { desc = "Move down" })
vim.keymap.set("i", "<C-l>", "<Right>", { desc = "Move right" })

vim.keymap.set("i", "<C-e>", "<C-o>e<C-o>l", { desc = "Jump a word" })
vim.keymap.set("i", "<C-b>", "<C-o>b<C-o>h", { desc = "Jump a word" })

vim.keymap.set("v", "v", "<Esc>", { desc = "Exit visual mode" })

vim.keymap.set("i", "jk", "<Esc>", { desc = "Exit insert mode" })
vim.keymap.set("i", "kj", "<Esc>", { desc = "Exit insert mode" })

vim.keymap.set("i", "<C-A-d>", '<C-o>"-yy<C-o>"-p', { desc = "Duplicate line" })
vim.keymap.set("n", "<C-A-d>", '"-yy"-p', { desc = "Duplicate line" })

vim.keymap.set("n", "<C-d>", "<C-d>zz", {})
vim.keymap.set("n", "<C-u>", "<C-u>zz", {})
vim.keymap.set("n", "<C-o>", "<C-o>zz", {})
vim.keymap.set("n", "<C-i>", "<C-i>zz", {})

vim.keymap.set("n", "<leader>fd", function()
	vim.diagnostic.open_float({ border = "rounded" })
end, { desc = "Floating diagnostic" })
vim.keymap.set("n", "<leader>q", function()
	vim.diagnostic.setloclist()
end, { desc = "Diagnostic setloclist" })

vim.keymap.set("n", "<leader>lr", ":LspRestart<CR>", { desc = "Restart LSP Server" })
vim.keymap.set("n", "<leader>v", "<c-v>", { desc = "Block select" })

vim.keymap.set("n", "<leader>rr", ":FlutterRun<CR>", { desc = "Run Flutter app" })
vim.keymap.set("n", "<leader>rs", ":FlutterRestart<CR>", { desc = "Restart Flutter App" })
vim.keymap.set("n", "<leader>rl", ":FlutterLogToggle<CR>", { desc = "Toggle Flutter Logs" })

vim.keymap.set("v", "i", "di", { desc = "Remove word and enter Insert mode" })

vim.keymap.set("n", "d", '"_d')
vim.keymap.set("v", "d", '"_d')
vim.keymap.set("n", "dd", '"_dd')

vim.keymap.set("n", "x", "d")
vim.keymap.set("o", "x", "d")
vim.keymap.set("x", "x", "d")
vim.keymap.set("v", "x", "d")

vim.keymap.set("n", "xx", "dd")

-- vim.keymap.set("i", "<CR>", function()
-- 	if vim.fn["coc#pum#visible"]() == 1 then
-- 		return vim.fn["coc#pum#confirm"]()
-- 	else
-- 		return "<CR>"
-- 	end
-- end, { expr = true, noremap = true })
--
-- -- GoTo code navigation
-- vim.keymap.set("n", "gd", "<Plug>(coc-definition)", { silent = true, nowait = true })
-- vim.keymap.set("n", "gy", "<Plug>(coc-type-definition)", { silent = true, nowait = true })
-- vim.keymap.set("n", "gi", "<Plug>(coc-implementation)", { silent = true, nowait = true })
-- vim.keymap.set("n", "gr", "<Plug>(coc-references)", { silent = true, nowait = true })
--
-- -- Show documentation
-- local function show_documentation()
-- 	if vim.fn.CocAction("hasProvider", "hover") == 1 then
-- 		vim.fn.CocActionAsync("doHover")
-- 	else
-- 		vim.api.nvim_feedkeys("K", "in", false)
-- 	end
-- end
--
-- vim.keymap.set("n", "K", show_documentation, { silent = true })
--
-- -- Symbol renaming
-- vim.keymap.set("n", "<leader>rn", "<Plug>(coc-rename)", { silent = true })
--
-- -- Code actions at cursor
-- vim.keymap.set("n", "<leader>ca", "<Plug>(coc-codeaction-cursor)", { silent = true })
--
-- -- Code actions for whole buffer
-- vim.keymap.set("n", "<leader>cs", "<Plug>(coc-codeaction-source)", { silent = true })
--
-- -- Quickfix current diagnostic
-- vim.keymap.set("n", "<leader>qf", "<Plug>(coc-fix-current)", { silent = true })
