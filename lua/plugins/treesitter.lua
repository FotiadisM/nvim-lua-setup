require("nvim-treesitter.configs").setup({
    ensure_installed = "maintained",
    highlight = {
        enable = true,
        use_languagetree = true
    },
	indent = {
		enable = true
	},
	autopairs = { enable = true },
	autotag = {
		enable = true,
	},
	context_commentstring = {
		enable = true,
		enable_autocmd = false
	},
	textsubjects = {
		enable = true,
		keymaps = {
			['.'] = 'textsubjects-smart',
			[';'] = 'textsubjects-container-outer',
		}
	},
	textobjects = {
		select = {
			enable = true,
			-- Automatically jump forward to textobj, similar to targets.vim
			lookahead = true,
			keymaps = {
				-- You can use the capture groups defined in textobjects.scm
				["ab"] = "@block.outer",
				["ib"] = "@block.inner",
				["av"] = "@parameter.outer",
				["iv"] = "@parameter.inner",
				["af"] = "@function.outer",
				["if"] = "@function.inner",
				["al"] = "@loop.outer",
				["il"] = "@loop.inner",
				["ac"] = "@class.outer",
				["ic"] = "@class.inner",
			},
		},
		swap = {
			enable = true,
			swap_next = {
				["<leader>a"] = "@parameter.inner",
			},
			swap_previous = {
				["<leader>A"] = "@parameter.inner",
			},
		},
	},
})

local parser_configs = require("nvim-treesitter.parsers").get_parser_configs()

parser_configs.http = {
  install_info = {
    url = "https://github.com/NTBBloodbath/tree-sitter-http",
    files = { "src/parser.c" },
    branch = "main",
  },
}

