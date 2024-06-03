return {
	"ThePrimeagen/harpoon",
	branch = "harpoon2",
	config = function()
		local harpoon = require("harpoon")

		harpoon:setup({
			settings = {
				save_on_toggle = true,
			},
		})

		vim.keymap.set("n", "<leader>af", function()
			harpoon:list():add()
		end, { desc = "Add file to Harpoon" })
		vim.keymap.set("n", "<leader>hg", function()
			harpoon.ui:toggle_quick_menu(harpoon:list())
		end, {
			desc = "Open Harpoon GUI",
		})

		for i = 1, 5, 1 do
			vim.keymap.set("n", "<leader>" .. i, function()
				harpoon:list():select(i)
				vim.cmd.normal("zz")
			end, { desc = "Goto Harpoon file " .. i })
		end

		vim.keymap.set("n", "<C-A-p>", function()
			harpoon:list():prev()
		end)
		vim.keymap.set("n", "<C-A-n>", function()
			harpoon:list():next()
		end)
	end,
}
