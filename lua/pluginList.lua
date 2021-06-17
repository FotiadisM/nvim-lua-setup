local packer = require("packer")
local use = packer.use

return packer.startup(
	function()
		use "wbthomason/packer.nvim"

		-- theme
		use "norcalli/nvim-base16.lua"
		use { "akinsho/nvim-bufferline.lua", requires = "kyazdani42/nvim-web-devicons"}
		use { "glepnir/galaxyline.nvim"}

		-- file managing , picker etc
		use "kyazdani42/nvim-tree.lua"
		use {
			"nvim-telescope/telescope.nvim",
			requires = {
				{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}
			}
		}
		use "nvim-telescope/telescope-media-files.nvim"

		-- language
		use "nvim-treesitter/nvim-treesitter"
		use "neovim/nvim-lspconfig"
        use "kabouzeid/nvim-lspinstall"
		use "hrsh7th/nvim-compe"
		-- use "nvim-lua/completion-nvim"
		use "onsails/lspkind-nvim"

		-- git
		use { "lewis6991/gitsigns.nvim", requires = {"nvim-lua/plenary.nvim"}}

		-- misc
		use "norcalli/nvim-colorizer.lua"
		use "karb94/neoscroll.nvim"
		use "windwp/nvim-autopairs"
		use {"lukas-reineke/indent-blankline.nvim", branch = "lua"}

	end
)
