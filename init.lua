require("pluginList")

-- theme
local base16 = require("base16")
base16(base16.themes["onedark"], true)
require "top-bufferline"
require "statusline"

-- file managing
require("nvimTree")
require("file-icons")
require("telescope-nvim")

-- language
require("treesitter")
require("nvim-lspconfig")
require("nvim-completion")

-- git
require("gitsigns-nvim")

-- misc
require("neoscroll").setup()
require("nvim-autopairs").setup()

-- colors
require("colors")
-- require("nvim-colorizer")

-- indent-blankline
vim.g.indent_blankline_char = "│"
vim.g.indent_blankline_use_treesitter = true
vim.g.indent_blankline_show_first_indent_level = false
vim.g.indent_blankline_show_trailing_blankline_indent = false
vim.g.indent_blankline_filetype_exclude = {"help", "terminal"}

-- General settings
vim.cmd("syntax on")
vim.o.relativenumber = true
vim.o.incsearch = true
vim.o.hlsearch = false
vim.o.showcmd = true
vim.o.updatetime = 100
vim.o.encoding= "UTF-8"
vim.o.tabstop = 4
vim.o.shiftwidth = 4
-- vim.o.expandtab = true -- use spaces instead of tabs
vim.o.mouse = "a"
vim.o.splitbelow = true
vim.o.splitright = true
vim.o.termguicolors = true
vim.o.signcolumn = "yes"
vim.o.hidden = true
vim.o.cmdheight = 1

vim.api.nvim_exec([[
	autocmd BufEnter * lua vim.o.fo = ""
]], false)

-- My mappings
vim.api.nvim_set_keymap("i", "jj", "<Esc>", { noremap = true })
vim.api.nvim_set_keymap("n", "<C-s>", ":w<CR>", { noremap = true})
vim.api.nvim_set_keymap("i", "<C-s>", "<Esc>:w<CR>a", { noremap = true })
vim.api.nvim_set_keymap("n", "<C-w>", ":e#<CR>:bd#<CR>", { noremap = true })

local opt = { noremap = true, silent = true}

-- moving between windows
vim.api.nvim_set_keymap("n", "<C-h>", "<C-w>h", opt)
vim.api.nvim_set_keymap("n", "<C-j>", "<C-w>j", opt)
vim.api.nvim_set_keymap("n", "<C-k>", "<C-w>k", opt)
vim.api.nvim_set_keymap("n", "<C-l>", "<C-w>l", opt)

-- resizing windows
vim.api.nvim_set_keymap("n", "<C-Up>", ":resize +3<CR>", opt)
vim.api.nvim_set_keymap("n", "<C-Down>", ":resize -3<CR>", opt)
vim.api.nvim_set_keymap("n", "<C-Left>", ":vertical resize +3<CR>", opt)
vim.api.nvim_set_keymap("n", "<C-Right>", ":vertical resize -3<CR>", opt)

-- copy to clipboard
vim.api.nvim_set_keymap("", "<C-c>", "\"+y", opt)

vim.api.nvim_exec([[
	command! Vt :vs term://zsh
	command! T :sp term://zsh
]], false)

-- if nvim starts with a directory as an argument, cd into it
vim.api.nvim_exec([[
	autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) | execute 'cd '.argv()[0] | endif
]], false)

