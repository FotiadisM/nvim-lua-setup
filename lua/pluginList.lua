local packer = require("packer")
local use = packer.use

return packer.startup(
	function()
		use "wbthomason/packer.nvim"

		-- theme
		-- use "norcalli/nvim-base16.lua"
		-- use "folke/tokyonight.nvim"
		use "marko-cerovac/material.nvim"
		use { "akinsho/nvim-bufferline.lua", requires = "kyazdani42/nvim-web-devicons" }
		use "glepnir/galaxyline.nvim"

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

		-- snippets
		-- use "norcalli/snippets.nvim"
        use "hrsh7th/vim-vsnip"
		use "hrsh7th/vim-vsnip-integ"
		use "rafamadriz/friendly-snippets"

		-- git
		use { "lewis6991/gitsigns.nvim", requires = "nvim-lua/plenary.nvim" }

		-- misc
		use "akinsho/nvim-toggleterm.lua"
		use "norcalli/nvim-colorizer.lua"
		use "karb94/neoscroll.nvim"
		use "windwp/nvim-autopairs"
		use "lukas-reineke/indent-blankline.nvim"
		use "folke/which-key.nvim"
		use "glepnir/dashboard-nvim"
	end
)
