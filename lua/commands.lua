vim.cmd([[
	command RestNvim lua require('rest-nvim').run()
	command RestNvimPreview lua require('rest-nvim').run(true)
]])
