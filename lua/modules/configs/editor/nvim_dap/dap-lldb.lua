local dap = require("dap")

dap.adapters.lldb = {
	type = "executable",
	command = "/usr/local/opt/llvm/bin/lldb-vscode",
	name = "lldb",
}
dap.configurations.cpp = {
	{
		name = "Launch",
		type = "lldb",
		request = "launch",
		program = function()
			return vim.fn.input('Path to executable (default to "progout"): ', vim.fn.getcwd() .. "/progout", "file")
		end,
		cwd = "${workspaceFolder}",
		args = function()
			local argument_string = vim.fn.input("Program arg(s) (enter nothing to leave it null): ")
			return vim.fn.split(argument_string, " ", true)
		end,
		env = function()
			local variables = {}
			for k, v in pairs(vim.fn.environ()) do
				table.insert(variables, string.format("%s=%s", k, v))
			end
			return variables
		end,

		-- if you change `runInTerminal` to true, you might need to change the yama/ptrace_scope setting:
		--
		--    echo 0 | sudo tee /proc/sys/kernel/yama/ptrace_scope
		--
		-- Otherwise you might get the following error:
		--
		--    Error on launch: Failed to attach to the target process
		--
		-- But you should be aware of the implications:
		-- https://www.kernel.org/doc/html/latest/admin-guide/LSM/Yama.html
		runInTerminal = false,
	},
}

dap.configurations.c = dap.configurations.cpp
dap.configurations.rust = dap.configurations.cpp
