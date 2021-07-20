local packer = require("packer")
local use = packer.use

return packer.startup(
	function()
		use "wbthomason/packer.nvim"

		-- theme
		-- use "norcalli/nvim-base16.lua"
		-- use "marko-cerovac/material.nvim"
		use "folke/tokyonight.nvim"
		use { "akinsho/nvim-bufferline.lua", requires = "kyazdani42/nvim-web-devicons" }
		use "hoob3rt/lualine.nvim"

		-- file managing, etc
		use "kyazdani42/nvim-tree.lua"
		use {
			"nvim-telescope/telescope.nvim",
			requires = { "nvim-lua/popup.nvim", "nvim-lua/plenary.nvim" },
			cmd = "Telescope"
		}
		use { "nvim-telescope/telescope-media-files.nvim", cmd = "Telescope" }
		use { "windwp/nvim-spectre", keys = "<leader>S" }

		-- language
		use { "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" }
		use "neovim/nvim-lspconfig"
        use "kabouzeid/nvim-lspinstall"
		use { "hrsh7th/nvim-compe", event = "InsertEnter" }
		use { "onsails/lspkind-nvim", event = "InsertEnter" }
		use { "ray-x/lsp_signature.nvim", event = "InsertEnter" }
		use {
			"folke/trouble.nvim",
			requires = "kyazdani42/nvim-web-devicons",
			keys = "<leader>ww"
		}
		use "simrat39/symbols-outline.nvim"
		use "kosayoda/nvim-lightbulb"

		-- snippets
		-- use "norcalli/snippets.nvim"
        use { "hrsh7th/vim-vsnip", event = "InsertEnter" }
		use { "hrsh7th/vim-vsnip-integ", event = "InsertEnter" }
		use { "rafamadriz/friendly-snippets", event = "InsertEnter" }

		-- debugging
		-- use "mfussenegger/nvim-dap"
		-- use "theHamsta/nvim-dap-virtual-text"
		-- use "rcarriga/nvim-dap-ui"

		-- git
		use { "lewis6991/gitsigns.nvim", requires = "nvim-lua/plenary.nvim" }
		use { "sindrets/diffview.nvim", cmd = "DiffviewOpen" }


		-- misc
		use { "famiu/nvim-reload", cmd = { "Restart", "Reload" } }
		use { "blackCauldron7/surround.nvim", event = "InsertEnter" }
		use { "terrortylor/nvim-comment", keys = "<leader>c" }
		use { "akinsho/nvim-toggleterm.lua", cmd = "ToggleTerm" }
		use "norcalli/nvim-colorizer.lua"
		use "karb94/neoscroll.nvim"
		use { "windwp/nvim-autopairs", event = "InsertEnter"}
		use "lukas-reineke/indent-blankline.nvim"
		use "folke/which-key.nvim"
		use "glepnir/dashboard-nvim"
		use { "folke/todo-comments.nvim", requires = "nvim-lua/plenary.nvim" }
		use "tweekmonster/startuptime.vim"
	end
)
