require("pluginList")

require("theme")
require("options")
require("mappings")

vim.notify = require("notify")

-- if nvim starts with a directory as an argument, cd into it and open NvimTree
vim.api.nvim_exec([[
	autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) | execute 'cd '.argv()[0] | execute 'NvimTreeOpen' | wincmd l | endif
]], false)

