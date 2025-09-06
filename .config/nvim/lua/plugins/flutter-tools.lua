return {
	"nvim-flutter/flutter-tools.nvim",
	lazy = false,
	dependencies = {
		"nvim-lua/plenary.nvim",
		"stevearc/dressing.nvim", -- optional for vim.ui.select
	},
	config = function()
		require("flutter-tools").setup({
			flutter_path = "/Users/marqhuez/.fluttersdk/bin/flutter",
		}) -- use defaults
	end,
}

--- Append lines to a file on disk <-- add this code to log.lua, and call it in M.log with {data}
---@param lines string[]
-- local function append_to_file(lines)
--   local file, err = io.open("/Users/marqhuez/flutter_dev_log_sync.txt", "a")
--   if not file then
--     ui.notify("Failed to open log file: " .. err, ui.ERROR)
--     return
--   end
--   for _, line in ipairs(lines) do
--     file:write(line .. "\n")
--   end
--   file:close()
-- end
