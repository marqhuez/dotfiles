-- nvchad onedar
-- return {
-- "notken12/base46-colors",
-- config = function()
-- 	require("onedark").setup()
-- end,
-- }
-- catppuccin
-- return {
-- 	"catppuccin/nvim",
-- 	name = "catppuccin",
-- 	priority = 1000,
-- 	config = function()
-- 		vim.cmd.colorscheme("catppuccin-macchiato")
-- 	end,
-- }
return {
	"olimorris/onedarkpro.nvim",
	priority = 1000, -- Ensure it loads first
	config = function()
		vim.cmd.colorscheme("onedark")

		vim.api.nvim_set_hl(0, "NvimTreeRootFolder", { fg = "#A9B0B8" })
		vim.api.nvim_set_hl(0, "NvimTreeFolderIcon", { fg = "#61AFEF" })

		vim.api.nvim_set_hl(0, "NvimTreeFolderName", { fg = "#5BA7CB" })
		vim.api.nvim_set_hl(0, "NvimTreeOpenedFolderName", { fg = "#5BA7CB" })

		vim.api.nvim_set_hl(0, "NvimTreeNormal", { fg = "#A9B0B8", bg = "#1B1F27" })
		vim.api.nvim_set_hl(0, "NvimTreeNormalNC", { fg = "#A9B0B8", bg = "#1B1F27" })

		vim.api.nvim_set_hl(0, "NvimTreeCursorLine", { bg = "#252931" })

		vim.api.nvim_set_hl(0, "Normal", { bg = "#1E222A" })
		vim.api.nvim_set_hl(0, "NormalNC", { bg = "#1E222A" })
		vim.api.nvim_set_hl(0, "SignColumn", { bg = "#1E222A" })

		vim.api.nvim_set_hl(0, "WinSeparator", { bg = "#1E222A", fg = "#1E222A" })

		vim.api.nvim_set_hl(0, "LineNr", { fg = "#3D3B3D", bg = "#1E222A" })
		vim.api.nvim_set_hl(0, "CursorLineNr", { fg = "#929F9F", bg = "#1E222A" })

		vim.api.nvim_set_hl(0, "TelescopeSelection", { fg = "#A9B0B8", bg = "#292c33", bold = true })
		vim.api.nvim_set_hl(0, "TelescopeMatching", { fg = "#61AFEF", bold = true })

		vim.api.nvim_set_hl(0, "GitSignsCurrentLineBlame", { bg = "#1E222A", fg = "#80848d" })
	end,
}
-- return {
-- 	"navarasu/onedark.nvim",
-- 	config = function()
-- 		vim.cmd.colorscheme("onedark")
-- 	end,
-- }
