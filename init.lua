require("pluginList")

-- theme
vim.g.material_style = "deep ocean"
vim.g.material_contrast = true
vim.g.material_hide_eob = true
require("material").set()
require "top-bufferline"
require "statusline"

-- file managing
require("nvimTree")
require("file-icons")
require("telescope-nvim")

-- language
require("treesitter")
require("nvim-lspconfig")
require("compe-nvim")

-- git
require("gitsigns-nvim")

-- misc
require("neoscroll").setup()
require("nvim-autopairs").setup()
require("colorizer").setup()
require("which-key").setup()

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

-- remove all format option, the autocmd is needed because option is being overwritten
vim.api.nvim_exec([[
	autocmd BufEnter * lua vim.o.formatoptions = ""
]], false)

-- My mappings
vim.api.nvim_set_keymap("i", "jj", "<Esc>", { noremap = true })
vim.api.nvim_set_keymap("n", "<C-s>", ":w<CR>", { noremap = true})
vim.api.nvim_set_keymap("i", "<C-s>", "<Esc>:w<CR>a", { noremap = true })
-- close current buffer and jump to the previous one
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

