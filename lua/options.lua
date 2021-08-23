-- disable builtin plugins
vim.g.netrw = 1
vim.g.netrwPlugin = 1
vim.g.netrwSettings = 1
vim.g.netrwFileHandlers = 1
vim.g.gzip = 1
vim.g.zip = 1
vim.g.zipPlugin = 1
vim.g.tar = 1
vim.g.tarPlugin = 1
vim.g.getscript = 1
vim.g.getscriptPlugin = 1
vim.g.vimball = 1
vim.g.vimballPlugin = 1
vim.g.html_plugin = 1
vim.g.logipat = 1
vim.g.rrhelper = 1
vim.g.spellfile_plugin = 1

-- General settings
vim.cmd("syntax on")
vim.o.wrap = false
vim.o.number = true
vim.o.relativenumber = true
vim.o.incsearch = true
vim.o.hlsearch = false
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.cursorline = true -- it's buggy for some reason
vim.o.showcmd = true
vim.o.updatetime = 100
vim.o.encoding= "UTF-8"
vim.o.scrolloff	= 10
vim.o.mouse = "a"
vim.o.splitbelow = true
vim.o.splitright = true
vim.o.termguicolors = true
vim.o.signcolumn = "yes"
vim.o.hidden = true

vim.o.completeopt = "menuone,noselect"
-- Avoid showing message extra message when using completion
vim.o.shortmess = vim.o.shortmess .. "c"

-- remove all format option, the autocmd is needed because option is being overwritten
vim.api.nvim_exec([[
	autocmd BufEnter * lua vim.o.formatoptions = ""
]], false)
