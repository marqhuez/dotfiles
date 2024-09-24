-- nvchad onedar
-- return {
-- "notken12/base46-colors",
-- config = function()
-- 	require("onedark").setup()
-- end,
-- }
-- catppuccin
return {
	"catppuccin/nvim",
	name = "catppuccin",
	priority = 1000,
	config = function()
		vim.cmd.colorscheme("catppuccin-macchiato")
	end,
}
--
-- return {
-- 	"navarasu/onedark.nvim",
-- 	config = function()
-- 		vim.cmd.colorscheme("onedark")
-- 	end,
-- }
