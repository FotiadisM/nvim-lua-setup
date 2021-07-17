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
			requires = { "nvim-lua/popup.nvim", "nvim-lua/plenary.nvim" }
		}
		use "nvim-telescope/telescope-media-files.nvim"

		-- language
		use "nvim-treesitter/nvim-treesitter"
		use "neovim/nvim-lspconfig"
        use "kabouzeid/nvim-lspinstall"
		use "hrsh7th/nvim-compe"
		use "onsails/lspkind-nvim"
		use "ray-x/lsp_signature.nvim"
		use { "folke/trouble.nvim", requires = "kyazdani42/nvim-web-devicons" }
		use "simrat39/symbols-outline.nvim"

		-- snippets
		-- use "norcalli/snippets.nvim"
        use "hrsh7th/vim-vsnip"
		use "hrsh7th/vim-vsnip-integ"
		use "rafamadriz/friendly-snippets"

		-- debugging
		-- use "mfussenegger/nvim-dap"
		-- use "theHamsta/nvim-dap-virtual-text"
		-- use "rcarriga/nvim-dap-ui"

		-- git
		use { "lewis6991/gitsigns.nvim", requires = "nvim-lua/plenary.nvim" }
		use "sindrets/diffview.nvim"


		-- misc
		use "famiu/nvim-reload"
		use "blackCauldron7/surround.nvim"
		use "terrortylor/nvim-comment"
		use "akinsho/nvim-toggleterm.lua"
		use "norcalli/nvim-colorizer.lua"
		use "karb94/neoscroll.nvim"
		use "windwp/nvim-autopairs"
		use "lukas-reineke/indent-blankline.nvim"
		use "folke/which-key.nvim"
		use "glepnir/dashboard-nvim"
		use { "folke/todo-comments.nvim", requires = "nvim-lua/plenary.nvim" }
	end
)
