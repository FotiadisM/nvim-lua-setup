local packer = require("packer")
local use = packer.use

return packer.startup({
	function()
		use "wbthomason/packer.nvim"

		-- theme
		use "folke/tokyonight.nvim"
		use {
			"akinsho/nvim-bufferline.lua",
			requires = "kyazdani42/nvim-web-devicons",
			config = function()
				require("plugins.bufferline")
			end
		}
		use "hoob3rt/lualine.nvim"

		-- file managing, etc
		use {
			"kyazdani42/nvim-tree.lua",
			config = function()
				require("plugins.nvim-tree")
			end
		}
		use {
			"nvim-telescope/telescope.nvim",
			requires = { "nvim-lua/popup.nvim", "nvim-lua/plenary.nvim" },
			cmd = "Telescope",
			config = function()
				require("plugins.telescope")
			end
		}
		use {
			"windwp/nvim-spectre",
			module = "spectre",
			config = function()
				require("spectre").setup()
			end
		}

		-- language
		use {
			"nvim-treesitter/nvim-treesitter",
			run = ":TSUpdate",
			config = function()
				require("plugins.treesitter")
			end
		}
		use {
			"RRethy/nvim-treesitter-textsubjects",
			requires = "nvim-treesitter/nvim-treesitter"
		}
		use {
			"RRethy/nvim-treesitter-textobjects",
			requires = "nvim-treesitter/nvim-treesitter"
		}
		use {
			"ThePrimeagen/refactoring.nvim",
			requires = {
				"nvim-lua/plenary.nvim",
				"nvim-treesitter/nvim-treesitter"
			},
			config = function()
				require("plugins.refactoring")
			end
		}
		use {
			"neovim/nvim-lspconfig",
			config = function()
				require("lsp.lspconfig")
			end
		}
		use "kabouzeid/nvim-lspinstall"
		use {
			"hrsh7th/nvim-compe",
			after = "LuaSnip",
			config = function()
				require("plugins.nvim-compe")
			end
		}
		use {
			"onsails/lspkind-nvim",
			event = "InsertEnter",
			config = function()
				require("lsp.lspkind")
			end
		}
		use {
			"ray-x/lsp_signature.nvim",
			module = "lsp_signature"
		}
		use {
			"folke/trouble.nvim",
			requires = "kyazdani42/nvim-web-devicons",
			cmd = "LspTroubleWorkspaceToggle",
			config = function()
				require("trouble").setup()
			end
		}
		use { "simrat39/symbols-outline.nvim", cmd = "SymbolsOutline" }
		use "kosayoda/nvim-lightbulb"

		-- snippets
		use {
			"L3MON4D3/LuaSnip",
			after = "friendly-snippets"
		}
		use {
			"rafamadriz/friendly-snippets",
			event = "InsertEnter",
		}

		-- debugging
		use {
			"mfussenegger/nvim-dap",
			config = function()
				require("dap.nvim-dap")
			end
		}
		use {
			"rcarriga/nvim-dap-ui",
			requires = { "mfussenegger/nvim-dap" },
			config = function()
				require("dapui").setup()
			end
		}
		-- use "theHamsta/nvim-dap-virtual-text"

		-- git
		use {
			"lewis6991/gitsigns.nvim",
			event = { "CursorMoved", "CursorMovedI" },
			requires = "nvim-lua/plenary.nvim",
			config = function()
				require("plugins.gitsigns")
			end
		}
		use {
			"sindrets/diffview.nvim",
			cmd = "DiffviewOpen",
			config = function()
				require("diffview").setup()
			end
		}

		-- misc
		use { "famiu/nvim-reload", cmd = { "Restart", "Reload" }}
		use {
			"FotiadisM/tabset.nvim",
			config = function()
			    require("plugins.tabset")
			end
		}
		use {
			"blackCauldron7/surround.nvim",
			event = "InsertEnter",
			config = function()
				require("surround").setup({})
			end
		}
		use {
			"terrortylor/nvim-comment",
			cmd = "CommentToggle",
			config = function()
				require("nvim_comment").setup({
					comment_empty = false,
					create_mappings = false,
					hook = function()
						require("ts_context_commentstring.internal").update_commentstring()
					end,
				})
			end
		}
		use "JoosepAlviste/nvim-ts-context-commentstring"
		use {
			"akinsho/nvim-toggleterm.lua",
			cmd = "ToggleTerm",
			config = function()
				require("toggleterm").setup()
			end
		}
		use {
			"pwntester/octo.nvim",
			after = "telescope.nvim",
			config=function()
				require("octo").setup()
			end
		}
		use {
			"norcalli/nvim-colorizer.lua",
			config = function()
				require("colorizer").setup()
			end
		}
		use {
			"windwp/nvim-autopairs",
			after = "nvim-compe",
			config = function()
				require("plugins.nvim-autopairs")
			end
		}
		use "windwp/nvim-ts-autotag"
		use {
			"lukas-reineke/indent-blankline.nvim",
			config = function()
				require("plugins.indent-blankline")
			end
		}
		use {
			"folke/which-key.nvim",
			config = function()
				require("which-key").setup()
			end
		}
		use {
			"folke/todo-comments.nvim",
			requires = "nvim-lua/plenary.nvim",
			config = function()
				require("todo-comments").setup()
			end
		}
		use "rcarriga/nvim-notify"
	end,
	config = {
		profile = {
			enable = true,
			threshold = 1 -- the amount in ms that a plugins load time must be over for it to be included in the profile
		}
	}}
)
