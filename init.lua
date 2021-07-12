require("pluginList")

-- theme
vim.g.material_style = "deep ocean"
vim.g.material_contrast = true
vim.g.material_hide_eob = true
require("material").set()
require "top-bufferline"
require("lualine").setup({
	options = {
		theme = "material",
	},
	extensions = { "nvim-tree" }
})

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
require("surround").setup({})
require("toggleterm").setup()
require("neoscroll").setup()
require("nvim-autopairs").setup()
require("colorizer").setup()
require("which-key").setup()
require("nvim_comment").setup({ create_mappings = false })

-- indent-blankline
vim.g.indent_blankline_char = "│"
vim.g.indent_blankline_use_treesitter = true
vim.g.indent_blankline_show_first_indent_level = false
vim.g.indent_blankline_show_trailing_blankline_indent = false
vim.g.indent_blankline_filetype_exclude = {"help", "terminal"}

-- dashboard
vim.g.dashboard_default_executive = "telescope"

-- General settings
vim.cmd("syntax on")
vim.o.wrap = false
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

local opt = { noremap = true, silent = true}
-- close current buffer and jump to the previous one
vim.api.nvim_set_keymap("n", "<leader>q", ":bp<bar>sp<bar>bn<bar>bd<CR>", opt)

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

-- terminal
vim.api.nvim_set_keymap("n", "<leader>t", ":ToggleTerm<CR>", opt)
vim.api.nvim_set_keymap("n", "<leader>T", ":ToggleTerm direction='float'<CR>", opt)

vim.api.nvim_set_keymap("n", "<leader>c", ":CommentToggle<CR>", opt)
vim.api.nvim_set_keymap("v", "<leader>c", ":CommentToggle<CR>", opt)
