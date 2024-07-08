return {
	"mfussenegger/nvim-dap",
	dependencies = {
		"nvim-neotest/nvim-nio",
		"rcarriga/nvim-dap-ui",
	},
	config = function()
		local dap, dapui = require("dap"), require("dapui")
		dapui.setup()

		dap.listeners.before.attach.dapui_config = function()
			dapui.open()
		end
		dap.listeners.before.launch.dapui_config = function()
			dapui.open()
		end
		dap.listeners.before.event_terminated.dapui_config = function()
			dapui.close()
		end
		dap.listeners.before.event_exited.dapui_config = function()
			dapui.close()
		end

		vim.keymap.set("n", "<leader>dt", dap.toggle_breakpoint, { desc = "Toggle breakpoint" })
		vim.keymap.set("n", "<leader>dc", dap.continue, { desc = "Continue debug" })
		vim.keymap.set("n", "<leader>ds", function()
			dap.disconnect()
			dapui.close()
			vim.cmd("NvimTreeToggle")
			vim.cmd("NvimTreeToggle")
			vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<c-w>l", true, true, true), "n", true)
		end, { desc = "Continue debug" })

		dap.adapters.php = {
			type = "executable",
			command = "node",
			args = { os.getenv("HOME") .. "/xdebug/out/phpDebug.js" },
		}

		dap.configurations.php = {
			{
				type = "php",
				request = "launch",
				name = "Listen for Xdebug",
				port = 9003,
				hostname = "192.168.0.106",
				pathMappings = {
					["/var/www/aurora"] = "/home/marqhuez/codebase/aurora",
				},
			},
		}
	end,
}
