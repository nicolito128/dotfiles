vim.pack.add({
	{ src = "https://github.com/mfussenegger/nvim-dap" },
	{ src = "https://github.com/leoluz/nvim-dap-go" },
	{ src = "https://github.com/rcarriga/nvim-dap-ui" },
	{ src = "https://github.com/nvim-neotest/nvim-nio" },
	{ src = "https://github.com/williamboman/mason.nvim" },
})

local dap = require("dap")
local ui = require("dapui")

ui.setup()
require("dap-go").setup()

local elixir_ls_debugger = vim.fn.exepath("elixir-ls-debugger")
if elixir_ls_debugger ~= "" then
	dap.adapters.mix_task = {
		type = "executable",
		command = elixir_ls_debugger,
	}

	dap.configurations.elixir = {
		{
			type = "mix_task",
			name = "phoenix server",
			task = "phx.server",
			request = "launch",
			projectDir = "${workspaceFolder}",
			exitAfterTaskReturns = false,
			debugAutoInterpretAllModules = false,
		},
	}
end

vim.keymap.set("n", "<space>b", dap.toggle_breakpoint, { desc = "DAP: Toggle Breakpoint" })
vim.keymap.set("n", "<space>gb", dap.run_to_cursor, { desc = "DAP: Run to Cursor" })

vim.keymap.set("n", "<space>?", function()
	ui.eval(nil, { enter = true })
end, { desc = "DAP: Eval under cursor" })

vim.keymap.set("n", "<F1>", dap.continue, { desc = "DAP: Continue" })
vim.keymap.set("n", "<F2>", dap.step_into, { desc = "DAP: Step Into" })
vim.keymap.set("n", "<F3>", dap.step_over, { desc = "DAP: Step Over" })
vim.keymap.set("n", "<F4>", dap.step_out, { desc = "DAP: Step Out" })
vim.keymap.set("n", "<F5>", dap.step_back, { desc = "DAP: Step Back" })
vim.keymap.set("n", "<F12>", dap.restart, { desc = "DAP: Restart" })

dap.listeners.before.attach.dapui_config = function()
	ui.open()
end
dap.listeners.before.launch.dapui_config = function()
	ui.open()
end
dap.listeners.before.event_terminated.dapui_config = function()
	ui.close()
end
dap.listeners.before.event_exited.dapui_config = function()
	ui.close()
end
