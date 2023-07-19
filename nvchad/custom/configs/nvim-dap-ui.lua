local dap, dapui = require("dap"), require("dapui")
dapui.setup()

if vim.fn.filereadable(".vscode/launch.json") then
	require("dap.ext.vscode").load_launchjs()
end

dap.listeners.after.event_initialized["dapui_config"] = function()
	dapui.open()
end
--dap.listeners.before.event_terminated["dapui_config"] = function()
--	dapui.close()
--end
--dap.listeners.before.event_exited["dapui_config"] = function()
--	dapui.close()
--end
