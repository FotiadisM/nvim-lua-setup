local dap = require("dap")

dap.adapters.go = {
	type = "server",
	host = "127.0.0.1",
	port = 38697,
}

dap.configurations.go = {
	{
		type = "go",
		name = "Debug",
		request = "launch",
		program = "${file}"
	},
	{
		type = "go",
		name = "Debug test",
		request = "launch",
		mode = "test",
		program = "${file}"
	},
	{
		type = "go",
		name = "Debug test (go.mod)",
		request = "launch",
		mode = "test",
		program = "./${relativeFileDirname}"
	}
}

vim.fn.sign_define("DapBreakpoint", {text='🛑', texthl='', linehl='', numhl=''})
