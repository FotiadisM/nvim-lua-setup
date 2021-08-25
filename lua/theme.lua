vim.g.tokyonight_style = "night"

vim.cmd[[colorscheme tokyonight]]

require("lualine").setup({
	options = {
		theme = "tokyonight",
		disabled_filetypes = {
			"packer",
			"dapui_scopes",
			"dapui_breakpoints",
			"dapui_stacks",
			"dapui_watches",
			"dap_repl"
		}
	},
	extensions = { "nvim-tree" },
})

